# Refining the Results

As seen from the results , the variable extraction pipeline, while effective, is not flawless. During extraction, many variable names were incorrectly identified, including extraneous words such as verbs and other non-relevant terms. Additionally, some variable-name columns were found to be empty, requiring further processing.

This phase addresses these issues by refining the variable extraction results. Specifically, it focuses on eliminating irrelevant words and filling in missing variable names. To achieve this, SpaCy's `tokens` attribute, particularly the **`.noun_chunks`** method, is employed. This method allows for the extraction of noun phrases from a given text.

Here’s how this process works:
- **Noun Chunks Extraction:** The `.noun_chunks` method is used to identify and extract noun phrases from the text. This method segments a sentence into meaningful chunks, focusing on the noun parts of the phrases.
- **Variable Position Alignment:** By leveraging the column that indicates the position of variables within the text, the correct noun sub-phrase corresponding to each variable's name is selected. This alignment ensures that each variable name is accurately identified and isolated from unrelated words.

> [!IMPORTANT]  
> The dataframe refinement pipeline is found in the [feature extraction notebook](notebooks/feature_extraction.ipynb) under the function's name `refine_df()`


The following diagram and code provide a more detailed explanation of this refinement process, illustrating how noun chunks are utilized to improve the accuracy of variable extraction : 


<p align="center">
  <img src="https://github.com/user-attachments/assets/9480c6a6-ef37-4ba1-979d-46a6876057a6" alt="refine-df-diag" width="700"/>
</p>

