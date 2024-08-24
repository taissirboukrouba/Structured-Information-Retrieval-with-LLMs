# Adding POS Tags 

Once the dataframe has been populated with sentences, along with their associated entities and labels, the next critical step is to perform **Part-of-Speech (POS) Tagging**. POS tagging is essential for enriching the textual data with syntactic information, which provides deeper context about the role and relationship of entities within each sentence. 

POS tagging assigns grammatical labels to each word in a sentence based on its role and position. These tags help elucidate the structure of the sentence, making it easier for NLP models to interpret and process the text. For instance, POS tags such as NN (Noun), DET (Determiner), and others categorize words into grammatical classes, which can significantly enhance the model’s understanding of the sentence structure and the distinctions between variables and other entities.

Without POS tagging, an NLP model may struggle to grasp the syntactic nuances of the text, making it challenging to differentiate between variable names and other types of entities or words. This is particularly important in tasks like variable extraction, where context and syntactic role play a crucial part in identifying and classifying variables accurately. By applying POS tagging, we can see how it helps in differentiating between various entities based on their syntactic roles within the sentence. 

> [!IMPORTANT]  
> The POS tags sections are found in the [feature extraction notebook](notebooks/feature_extraction.ipynb) under the function's name `POS_tag()` and `add_tags()`

**Example :** I get the following results by applying the POS pipeline on this sentence : 

<p align="center" style="font-size:18px;"><i>"we deﬁne the ﬂow at the surface by U(x), z = 0..."</i></p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/0d817ad8-df88-44de-b751-b5fef8363e77" alt="pos-test-results" width="500"/>
</p>


This `add_tags()` function takes the sentences found in the dataframe and applies the POS tag function to them , after getting the results i append them into a tags list and lastly into the new dataframe's column "tags". Sample result of this function is showed in the following figure : 


<p align="center">
  <img src="https://github.com/user-attachments/assets/22d22188-eb7a-44d4-b8a6-67e468c8a068" alt="pos-test-results" width="700"/>
</p>
