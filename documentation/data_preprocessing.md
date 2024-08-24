# Data Preprocessing 


The initial phase involves processing the PDF documents, which have been converted into text files and subsequently organized into a designated directory. These text files will undergo a comprehensive preprocessing procedure as displayed in the following diagram : 

<p align="center">
  <img src="https://github.com/user-attachments/assets/cc2f5b8f-2633-4c09-87cf-1420cfc24068" alt="data-preprocessing" width="800"/>
</p>

Upon conversion of the PDF data into text format, it is crucial to undertake a thorough cleaning and validation process to ensure the integrity and accuracy of the text. This preprocessing phase is critical for preparing the data for further analysis and involves a series of methodical steps, which are outlined below:



- **Regex Preprocessing**: This step involves applying regular expression-based techniques to systematically clean and normalize the text data. Regex preprocessing includes tasks such as removing unwanted characters, standardizing formats, and correcting common text extraction errors. This step is essential for ensuring that the text data adheres to a consistent format, which facilitates more accurate downstream processing.

- **Text Reconstruction**: After regex preprocessing, the next step is text reconstruction. This involves reassembling and organizing the text data to restore its logical structure and readability. Text reconstruction addresses issues such as fragmented sentences, misplaced line breaks, and inconsistencies in formatting. The goal is to produce a coherent and well-structured text corpus that accurately reflects the original content of the PDFs.


## I - Regex Preprocessing : 

The original text might have a lot of additional information which is not relevant in  this use case. This explains it being the first steps which includes the use of regex expressions to clean the textual data. This eventually is removing references , page numbers , URLs and in-text references. 

