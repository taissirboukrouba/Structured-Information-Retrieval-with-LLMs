# Creating the Dataframe 

To construct the dataframe, the initial step involves ingesting the raw text data. This text is then tokenized into individual sentences using NLTK's **sentence tokenizer**, a robust tool for segmenting text into sentence-level tokens. The tokenization process is crucial as it prepares the text for more granular processing.

Following sentence tokenization, the sentences are further dissected into sub-sentences based on commas (`,`). This step is designed to improve the accuracy of variable name extraction by isolating distinct units of meaning. The rationale behind this approach is that while a single sentence might contain multiple variables, each sub-sentence—representing a single idea or clause—will typically contain only one variable. This segmentation ensures that the extraction process can more effectively identify and classify individual variables.

Moreover, to mitigate potential confusion with variables embedded in equations or numerical values, an additional split is performed on the equal sign (`=`). This further refines the data by separating out expressions where variables are equated, ensuring that the extraction process focuses solely on relevant variable names and avoids extraneous numerical values or equation components.

Once this preprocessing is complete, the refined sub-sentences are processed through the **`custom_NER_Tokenization()`** function. This custom function integrates specialized tokenization with entity extraction into a cohesive pipeline. This function applies a tailored approach to identify and label entities within the text, combining the benefits of custom tokenization techniques with advanced entity recognition capabilities.



> [!IMPORTANT]  
> The dataframe creation pipeline is found in the [feature extraction notebook](notebooks/feature_extraction.ipynb) under the function's name `create_df()`

This process and its implementation are visually represented in the diagram provided below :


<p align="center">
  <img src="https://github.com/user-attachments/assets/ca39e917-23d6-416f-ad81-1fede74a2845" alt="create-df" width="900"/>
</p>


