# Structured Information Retrieval with LLMs

- **Author(s):** Taissir Boukrouba
- **Affiliation:** University of Hertfordshire   
- **Date:** 09/2024

---

## Table of Contents
- [Document Control](#document-control)
- [Project Overview](#project-overview)
- [Ethical Considerations](#ethical-considerations)
- [Installation](#installation)
- [Computational Environment](#computational-environment)
- [Methodology](#methodology)
    - [I - Data Collection](#i---data-collection)
    - [II - Data Perparation](#ii---data-preparation)
    - [III - Data Preprocessing](#iii---data-preprocessing)
    - [IV - Feature Extraction](#iv---feature-extraction)
    - [V - Modelling](#v---modelling)
- [Results](#results)
- [Discussion](#discussion)
- [License](#license)
- [References](#references)

---
## Document Control

## Project Overview

Knowing the importance of research papers and the huge amounts of its unstructured data that is submitted to the web , makes it a very prominent problem . Significant insights has been left as brute text in these papers that makes it not easily accessible. The aim of this project is to compare the ability of several LLMs  to extract variables and their names from physics research papers. This task is called sequence labelling where a sentence is given and each of its token is categorised into the convenient class. A collection of papers collected from Arxiv ,  an open-access repository for research papers, particularly in the fields of physics, mathematics and computer science. The data is in the format of PDFs which was transformed into text using python PDF to text translation tools. Data preprocessing techniques special for NLP are used to clean the text , which was later put in a feature extraction pipeline using different grammatical tools such as POS and NER  to extract and create a dataframe of variables and their names. The result data which had two iterations (one with 300 rows and the second with 2K rows) is to be trained on two different types of models , one is pre-trained (DistillBERT) and the other is from scratch (Encoder-only Transformer). 

## Ethical Considerations 
- In [Cornel’s University Privacy Principles](https://privacy.cornell.edu/privacy-cornell/privacy-principles-cornell) "Support for US and International Data Privacy Standards" and [ArXiv’s Privacy Policy](https://info.arxiv.org/help/policies/privacy_policy.html)  "Special Notice for EU Residents" sections mention and acknowledge GDPR requirements where they list principles like Notice, Data Integrity, Purpose Limitation, Access, and Security, which corresponds to GDPR rules (creating, maintaining, using or disseminating personal data must take "reasonable and appropriate" security measures)

- The [UH policy](https://www.herts.ac.uk/research/research-management/ethics-and-research-integrity) focuses on the integrity of the research itself, not necessarily the platform (ArXiv). This project does not violate any copyright infringements or data fabrication (all data uploaded to ArXiv is verified by its moderators). 

- Under [ArXiv’s terms and submission agreements](https://info.arxiv.org/help/policies/submission_agreement.html) “Grant of the License to arXiv” submitters agree that their submission grants us (content users) a non-exclusive, perpetual, irrevocable, and royalty-free license to include and use their work 

## Installation

Give instructions on how to install and set up your project. This could include:
- Prerequisites (e.g., Python version, libraries, tools)
- Cloning the repository
- Installing dependencies
- Any other setup steps

```bash
# Example commands
git clone https://github.com/username/project-name.git
cd project-name
pip install -r requirements.txt
```
## Computational Environment



## Methodology 

### I - Data Collection 
The dataset is called [ArXiv](https://arxiv.org) from the website which is open access. The data was collected from Google Cloud Storage (GCS) where it was available for free in buckets for bulk Access. The command line tool [gsutil](https://cloud.google.com/storage/docs/gsutil) was used to access ArXive’s physics PDF buckets and downloaded into local machine. The dataset was then uploaded into Google Drive to be easily accessed through Google Collab. 
### II - Data Preparation
> [!NOTE]  
> The complete implementation for this phase is available and can be found in the notebooks folder [here](notebooks/data_preparation.ipynb)

This is the first step of the pipeline. The goal is to get from PDF data into text data. Since the files I have are native PDFs (which means text is already digitally encoded), there is no need to apply any OCR (Optical Character Recognition) techniques because it's less accurate and can lead to more grammatical errors. This means I will use **PyMuPDF**, **PyPDF2**, and **PDFMiner.six**. I will have two tests where the first test is general text extraction using one PDF file from the dataset. The pipeline is summarised in the following diagram : 

<p align="center">
  <img src="https://github.com/user-attachments/assets/4bf99ea6-6b66-477d-bc48-0c921f6f8fbb" alt="data-preparation" width="800"/>
</p>

In terms of text parsing , PDFMiner.six had the best results with impressive formatting and absence of text spacing issues . Symbol detection was moderate but the best compared to the other tools. Also , when tested on the math notations it had moderate but acceptable performance. Since PYPDF2 spacing issue couldn't be fixed , PDFminer.six is the tool to be used for PDF translation into textual data. The following table will summarize the performances of the all three tools tested on the PDF sample and math notations : 
<div align="center">

|                   | **PyMuPDF**          | **PyPDF2**           | **PDFMiner.six**     |
|-------------------|----------------------|----------------------|----------------------|
| **Test I**        | Moderate             | Bad                  | Good                 |
| **Test II**       | Bad                  | Good                 | Moderate             |
| **Upsides**       | Moderate formatting  | Good symbol detection| Good formatting      |
| **Downsides**     | Extremely bad symbol detection | Very bad formatting | Moderate symbol detection |
| **Decision**      | Excluded           | Excluded           | Selected                 |

</div>


### III - Data Preprocessing

> [!NOTE]  
> The complete implementation for this phase is available and can be found in the notebooks folder [here](notebooks/data_preprocessing.ipynb)

The initial phase involves processing the PDF documents, which have been converted into text files and subsequently organized into a designated directory. These text files will undergo a comprehensive preprocessing procedure as displayed in the following diagram : 

<p align="center">
  <img src="https://github.com/user-attachments/assets/cc2f5b8f-2633-4c09-87cf-1420cfc24068" alt="data-preprocessing" width="800"/>
</p>

Upon conversion of the PDF data into text format, it is crucial to undertake a thorough cleaning and validation process to ensure the integrity and accuracy of the text. This preprocessing phase is critical for preparing the data for further analysis and involves a series of methodical steps, which are outlined below:

- **Regex Preprocessing**: This step involves applying regular expression-based techniques to systematically clean and normalize the text data. Regex preprocessing includes tasks such as removing unwanted characters, standardizing formats, and correcting common text extraction errors. This step is essential for ensuring that the text data adheres to a consistent format, which facilitates more accurate downstream processing.

- **Text Reconstruction**: After regex preprocessing, the next step is text reconstruction. This involves reassembling and organizing the text data to restore its logical structure and readability. Text reconstruction addresses issues such as fragmented sentences, misplaced line breaks, and inconsistencies in formatting. The goal is to produce a coherent and well-structured text corpus that accurately reflects the original content of the PDFs.

These preprocessing procedures are designed to refine the raw text data and enhance its quality, thereby improving the reliability and effectiveness of subsequent analyses and applications.

> [!IMPORTANT]  
> For a more in-depth exploration , please refer to the following document

### IV - Feature Extraction
After meticulously transforming and cleaning the text data, we now move to a crucial phase in the data processing pipeline: the extraction of (variable, name) pairs from the documents. This phase is instrumental in structuring the data for meaningful analysis. To achieve accurate and reliable extraction, this phase is broken down into a series of 7 steps, each designed to systematically address different aspects of the data and ensure that the resulting pairs are both precise and relevant. The steps involved in this phase are as follows : 

1. Defining Weak Labels
2. Defining Custom Tokenizer
3. Defining Custom NER
4. Creating the DataFrame
5. Adding POS Tags
6. Extracting Variable-Name Couples
7. Refining the Results



### V - Modelling


## Results 
## Discussion
## References

## License






