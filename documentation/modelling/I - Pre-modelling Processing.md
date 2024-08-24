# Pre-modelling Processing 

> [!IMPORTANT]  
> The pre-modelling process pipeline is found in the [modelling notebook](notebooks/modelling.ipynb) under the function's `label_mapper()` and `PersonalisedEncoding()`

## I - Result data preprocessing : 

Upon the end of the feature extraction pipeline , the dataframe extracted had to be further cleaned before it being passed to the modelling phases. This included the variables and names columns being wrapped inside brackets to include the cases when i had more than one variable per sub-sentence. I already discussed that the multiple variable case would not be considered in order to avoid the process taking longer. This also includes dropping duplicated columns and dropping `variable_position` column since it's no longer needed. This process is found in the `preprocessing()` function. 



## II  - Sentence Tokenisation : 

Using the custom tokenizer I previously developed during the feature extraction phase, I am reapplying it here to the resulting dataframe's sentences. This step is essential as it ensures consistency in how the text data is processed across different phases of the pipeline. By tokenizing these sentences once again, I generate a structured and tokenized version of each sentence. This refined text will serve as the foundation for the subsequent labeling process, enabling more accurate identification and categorization of key elements within the sentences. This approach not only maintains the integrity of the data but also enhances the overall reliability of the labeling phase. This process is found in the `tokenise()` function. 

## III - Tokens Labelling : 

Labelling is one of the most important parts in this pipeline , since these defined labels are going to be trained  and learned by the model in order to be able to rightfully classify sentence tokens into the right labels. Since the problems is extracting mathematical variables and their names , the defined labels are as follows : 

<div align="center">

| **Label** | **Explanation** |
|-----------|-----------------|
| **B-VAR**    | This is used to annotate and label the variable entity |
| **B-NAME**    | This is used to label the first instance (beginning) of a variable's name |
| **I-NAME**    | This is used to label whatever comes after the first instance (inside) of a variable's name |
| **O**         | This is used to annotate outside labels (labels that are not of the defined labels) |

</div>

As shown in the table , the variable doesn't have an inside label (I-VAR) and that's because the variable is always one instance or token and cannot be more than one word. The following example will make these labels more understandable : 

<p align="center">
  <img src="https://github.com/user-attachments/assets/c102124e-6e88-43de-9dfe-ebd9bf90dcdf" alt="ent-labelling" width="500"/>
</p>

To properly label the data, I first iterated through the dataframe columns and labeled all entities as an outside label (**O**) to ensure that everything was fairly initialized. This was done using a labels list. Next, I checked if the extracted variable was present in the tokenized sentence. If it was, I took its index and labeled it in the labels list as **B-VAR**.

Then, I split the variable's name using Python's `split()` function (which uses whitespace as the default separator) and obtained the indexes of its first and last elements. Using these two indexes, I labeled the first index in the labels list as **B-NAME** and everything else until the last index as **I-NAME**. If the variable split had a length of 1 (meaning the variable's name was just one word), I retrieved the index and labeled it as **B-NAME**. This process is simmarised inside the `labelling()` function. 


## IV - Data Encoding : 
Unstructured data are raw data that can't be understood by a machine. To make them understandable, a transformation into machine-readable format is necessary so that the model can understand and learn patterns that can aid in future predictions. One of the most important encodings in NLP includes attention masks, label IDs, and input IDs:

- **Attention Masks**: These help the model differentiate between tokens to focus on and those to ignore.
- **Label IDs**: These are numerical encodings assigned to the defined categories of the data.
- **Input IDs**: These are unique numerical encodings assigned to each text in the sequence.

The component responsible for this task is the tokenizer, which not only returns attention masks and input IDs but also decodes them and performs many other functions. Note that label IDs are not returned by the tokenizer but are manually transformed by the user. This process is different for both finetuned model and the scratch model where : 

### Finetuned Model Encodiing :

the pre-trained models have tokenisers, but their token extraction methods don't accurately represent my custom task's goals. To address this, i can change the pre-trained model's token extraction function to the custom tokenisation. This is shown inside the pre-trained model class named `CustomDistillBertTokeniser()`

Before continuing the process , i have to add the tokens that are not usually recognised by the tokeniser. In my case , these are the functions. The reason behind doing that is that creating a custom tokeniser is not enough , where yes it can split the tokens as instructed these tokens will be labeled as \textbf{UNK} (unknown) sine these are new labels that are not part of the tokeniser's vocabulary. Adding them helps the model to give them specific ids and learn their patterns in addition to the usual tokens. After adding them , it is much needed to resize the tokeniser's embedding so it takes in consideration the new tokens. These new tokens are are added as follows : 

```python
# added tokens are extracted using gloabl variables 
num_added_tokens = tokenizer.add_tokens(added_tokens)

# resizing token embeddings 
model.resize_token_embeddings(len(tokenizer))

```
Now , that i have the new tokens added , it's time to convert the dataframe into a HuggingFace Dataset so i can apply the mapping (encoding) now that it also includes the label ids. All of this is defined in the  `label_mapper()` function. 


### Scratch Model Encodiing :

Since i'm defining a model from scratch , the tokeniser has to also be .The only thing that was imported is the vocabulary to save some time.This means i initialised the vocab and inverse vocabulary , used my custom tokeniser , defined functions that get token ids and decode them , function to add tokens and also to create attention masks (this function is found in Github). After doing so , i combined those in a function that also creates labels id which is called `PersonalisedEncoding()`. 








