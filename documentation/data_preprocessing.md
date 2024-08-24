# Data Preprocessing 


The initial phase involves processing the PDF documents, which have been converted into text files and subsequently organized into a designated directory. These text files will undergo a comprehensive preprocessing procedure as displayed in the following diagram : 

<p align="center">
  <img src="https://github.com/user-attachments/assets/cc2f5b8f-2633-4c09-87cf-1420cfc24068" alt="data-preprocessing" width="800"/>
</p>

Upon conversion of the PDF data into text format, it is crucial to undertake a thorough cleaning and validation process to ensure the integrity and accuracy of the text. This preprocessing phase is critical for preparing the data for further analysis and involves a series of methodical steps, which are outlined below:



- **Regex Preprocessing**: This step involves applying regular expression-based techniques to systematically clean and normalize the text data. Regex preprocessing includes tasks such as removing unwanted characters, standardizing formats, and correcting common text extraction errors. This step is essential for ensuring that the text data adheres to a consistent format, which facilitates more accurate downstream processing.

- **Text Reconstruction**: After regex preprocessing, the next step is text reconstruction. This involves reassembling and organizing the text data to restore its logical structure and readability. Text reconstruction addresses issues such as fragmented sentences, misplaced line breaks, and inconsistencies in formatting. The goal is to produce a coherent and well-structured text corpus that accurately reflects the original content of the PDFs.

> [!IMPORTANT]  
> The data preprocessing pipeline is found in the [data preprocessing notebook](notebooks/data_preprocessing.ipynb) under the function's name `preprocess_text()`

## I - Regex Preprocessing : 

The original text might have a lot of additional information which is not relevant in  this use case. This explains it being the first steps which includes the use of regex expressions to clean the textual data. This eventually is removing references , page numbers , URLs and in-text references. 

**Example :** The following figures will show the changes with an image before regex preprocessing (on the left) and after the preprocessing (on the right) : 

<div align="center">
  <img src="https://github.com/user-attachments/assets/5831ef26-4e9c-4b15-8b09-9b5561759b7e" width="47%" alt="before-regex-I">
  <img src="https://github.com/user-attachments/assets/112994ca-bfc5-4ec5-9e5a-9d38bb34d41b" width="41%" alt="after-regex-I">
</div>

- And this before and after removing the references section : 
<div align="center">
    <img src="https://github.com/user-attachments/assets/88b4cfde-517b-4c39-b297-badd92ae6b99" width="47%" alt="before-regex-II">
    <img src="https://github.com/user-attachments/assets/7d527da9-1c1e-4268-a2c8-89d9aed1ab4f" width="47%" alt="after-regex-II">
</div>

## II - Text Reconstruction : 

The original text might have unnecessary line skips and that is because the text extraction tools failed to get the right format of the document. This happens usually when there is use of mathematical equations that do no conform with the text encoding defined in the text extraction tool. To solve this problem , i use SpaCy to tokenize the text into sentence tokens and i replace every line skip in each sentence with a space and add the cleaned sentences into a list. Then i join the collection of these sentences with line skips again to get a better format of the original document. 

**Example :** The following figures will show the changes with an image before text reconstruction (on the left) and after the reconstruction (on the right) : 

<div align="center">
    <img src="https://github.com/user-attachments/assets/3b4d56ff-e142-4ac1-af74-92e79d8b5822" width="47%" alt="before-text-reconst">
    <img src="https://github.com/user-attachments/assets/4e4c9731-5665-4f9d-90d5-ed93d28e03bd" width="47%" alt="after-text-reconst">
</div>

