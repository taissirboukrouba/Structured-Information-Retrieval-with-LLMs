# Cleaning the Datafarme 

As you have seen in the previous figure of the dataframe , some entities are left empty , some of them will not be used and also other sentences are just pure mathematical equations that doesn't help my case in any shape or form. Following these set of problems , the next thing to do is to clean the dataframe from these unusual instances. This process is summarised in the following diagram : 

<p align="center">
  <img src="https://github.com/user-attachments/assets/8b32def5-a054-462e-a4b5-ce23b07891c3" alt="clean-df-diag" width="700"/>
</p>



> [!IMPORTANT]  
> The data cleaning process is found in the [feature extraction notebook](notebooks/feature_extraction.ipynb) under the function's name `clean_df()`

## I - False Variables : 

In the context of variable extraction and text analysis, certain letters can often be misidentified as variables due to their common usage and visual similarity. Specifically, letters such as "a" and "i" in the English language can pose challenges because they are frequently used both as variables and as part of regular text. This overlap can lead to ambiguities, making it difficult for automated systems to accurately distinguish between actual variables and ordinary text components.

- The following figures provide a detailed analysis of these ambiguities. They illustrate the specific scenarios where letters like "a" and "i" are used in various contexts and explain the distinctions that must be made to correctly identify variables. Understanding these distinctions is crucial for refining the accuracy of variable extraction and improving the overall performance : 


<div align="center">
  <img src="https://github.com/user-attachments/assets/68268186-b880-4f7f-96c6-d32db4bb536f" width="47%" alt="POS Case of 'i'">
  <img src="https://github.com/user-attachments/assets/cce11a84-bdc3-416b-9187-3eee2969d03c" width="41%" alt="POS Case of 'a'">
</div>

- As seen , there is cases where "a" and "i" are variables ,which is the second case for both of them , and some instances where they are just a determiner (a)  or preposition (i). The results are showing that POS cannot differentiate between the cases using its tags since both of them are determiner (in both case for a) and preposition (in both cases for I). Since these are marginal cases that represent a very small proportion of all possible variable combinations , i decided to get rid of them and only when it's clear they're not variables (when they're at the start of a sentence). The following code deals with this problem : 


## II - Equational Clauses :

Some sentences contain only mathematical numbers, symbols, and operations, which may confuse the model and create bias. To avoid this, a function has been defined to handle these sentences, ensuring the model's performance is not affected by excessive equations. 

In this function (`is_real_sent()`) , I looped over the tokens i've got from the doc object, and using [WordNet](https://www.nltk.org/howto/wordnet.html) an English Language lexical database library , i applied its function **synsets** (sets of cognitive synonyms) where if the word's in question synonym is found therefore that word is a real word and it has real meaning and else otherwise. By applying this to each word of a sentence , i added the Boolean results of either **True** (for real word) and **False** (for not). Finally , i calculate the percentage of non-real words and if it's more than 50\% , the whole sentence is not a real word sentence and will be dropped immediately in later process. 

## III - Low Count Entities & Labels :
Empty Entities and low count labels are not usable in my case since both are needed to process the sentences later and extract the variables-names compounds. Labels are needed to be at least the length of 4 onwards so i can have a full complex sentence that can be processed.

## II - Creating the pipeline :

All of these preprocessing and transformation steps are integrated into the `clean_df()` function. This function serves as a comprehensive pipeline that consolidates the data cleaning operations necessary for preparing the data for analysis. 










