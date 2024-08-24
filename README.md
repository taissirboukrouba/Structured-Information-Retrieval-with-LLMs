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

- **Regex Preprocessing:** Uses regular expressions to clean and standardize text, removing unwanted characters and fixing extraction errors for consistency.
- **Text Reconstruction:** Reassembles and organizes text to correct formatting issues and restore readability, ensuring a coherent and well-structured corpus.


These preprocessing procedures are designed to refine the raw text data and enhance its quality, thereby improving the reliability and effectiveness of subsequent analyses and applications.

> [!IMPORTANT]  
> For a more in-depth exploration , please refer to the following [document](documentation/data_preprocessing.md)

### IV - Feature Extraction

After meticulously transforming and cleaning the text data, we now move to a crucial phase in the data processing pipeline: the extraction of (variable, name) pairs from the documents. This phase is instrumental in structuring the data for meaningful analysis. To achieve accurate and reliable extraction, this phase is broken down into a series of 7 steps, each designed to systematically address different aspects of the data and ensure that the resulting pairs are both precise and relevant. The steps involved in this phase are as follows : 

1. [Defining Weak Labels](documentation/feature%20extraction/I%20-%20Defining%20Weak%20Labels.md)
2. [Defining Custom Tokenizer](documentation/feature%20extraction/I%20-%20Defining%20Custom%20Tokenizer.md)
3. [Defining Custom NER](documentation/feature%20extraction/III%20-%20Defining%20Custom%20NER.md)
4. [Creating the DataFrame](documentation/feature%20extraction/IV%20-%20Creating%20the%20Dataframe.md)
5. [Adding POS Tags](documentation/feature%20extraction/V%20-%20Adding%20POS%20Tags.md)
6. [Cleaning Dataframe](documentation/feature%20extraction/VI%20-%20Cleaning%20the%20Dataframe.md)
7. [Extracting Variable-Name Couples](documentation/feature%20extraction/VII%20-%20Extracting%20Variable-Name%20Couples.md)
8. [Refining the Results](documentation/feature%20extraction/VIII%20-%20Refining%20the%20Results.md)

> [!NOTE]  
> The complete implementation for this phase is available and can be found in the notebooks folder [here](notebooks/feature_extraction.ipynb)

Lastly , All of these previous steps are combined to create the full feature extraction pipeline. Also , due to the limited time and the long demanding process , i only created 2 iterations (versions) of the result's dataframe where : 


<div align="center">

| **Iteration**      | **Row Count** |
|--------------------|---------------|
| First Iteration    | 300           |
| Second Iteration   | 2100          |

</div>

### V - Modelling

To transition into the modeling phase, we start with pre-modeling processing, a critical step where the data undergoes thorough preparation and refinement before it gets pushed into the models. This ensures that the dataset is in the best possible condition, free from noise and ready for accurate analysis. Following this, we move into the model definition stage, where careful consideration is given to selecting the appropriate models. Specifically, this involves choosing a pre-trained model that can leverage existing knowledge and a custom model built from scratch, tailored to the specific nuances of our dataset. The architectures of these models are meticulously designed to effectively capture the underlying patterns and relationships, providing a robust foundation for subsequent training and evaluation. Therefore we have 2 steps in this phase : 

1. [Pre-modelling processing](documentation/modelling/I%20-%20Pre-modelling%20Processing.md)
2. [Model Selection](documentation/modelling/II%20-%20Model%20Selection.md) 

All of the modelling pipeline parameters for both models is summarised in this table : 
<div align="center">

| **Parameter**          | **Value**                       | **Parameter**          | **Value**                     |
|------------------------|---------------------------------|------------------------|-------------------------------|
| **Save Directory**     | Custom to each model            | **Logging Steps**      | 100                           |
| **Learning Rate**      | 2e-5                            | **Evaluation Strategy**| "epochs"                      |
| **Epochs**             | 10 or 20                        | **Save Strategy**      | "epochs"                      |
| **Steps**              | 100                             | **Per Device Batch**   | 16                            |
| **Weight Decay**       | 0.01                            | **Early Stopping**     | Only for fine-tuned model     |

</div>

## Results 

![loss](https://github.com/user-attachments/assets/c10d65d5-f1c2-4d1c-9cfc-694acb8f97d3)
![accuracy](https://github.com/user-attachments/assets/4759fe19-86dd-4a92-8b41-c0f1d13c8413)


The graphs show the evolution of loss and accuracy for both defined models (DistillBERT and Custom Transformer) across two dataset versions (Iteration 1 and Iteration 2). Overall, the DistillBERT model demonstrates superior performance compared to the Custom Transformer, which is notably slower in both iterations, exhibiting lower accuracy and higher loss.

In particular, the loss graph indicates that DistillBERT in the first iteration starts with a higher loss close to 100%, which decreases rapidly and then levels off after approximately 5 epochs. It then begins to increase steadily after the 8th epoch, eventually reaching a loss of 55%. In contrast, both Custom Transformer curves show more stability. The second iteration of the Custom Transformer displays about 5% more loss compared to the first iteration, ending at 78% and 65% loss, respectively. Conversely, the second iteration of DistillBERT starts with the lowest loss at 45%, which drops to below 30% after the third epoch, stabilizes, and fluctuates until reaching a minimal loss of 30% again.

For the accuracy graph, which reflects the loss, it is evident that the model with the least loss achieved the highest accuracy of approximately 94% (DistillBERT II), with a 96% F1-score for detecting variables and around 66% F1-score for name extraction. DistillBERT I follows with 87% accuracy, while the Custom Transformers (Iteration 2 and Iteration 1) achieve 69% and 65% accuracy, respectively. 

Both successfully fine-tuned models were tested on a couple of sentences with the following results:

### Example 1
*Sentence:* _The electric potential energy f(x)_

| **Token**    | **Prediction** | **DistillBERT I** |
|--------------|----------------|-------------------|
| the          | B-NAME         | 0.96              |
| electric      | I-NAME         | 0.49              |
| potential     | I-NAME         | 0.73              |
| energy        | I-NAME         | 0.86              |
| f(x)          | B-VAR          | 0.96              |

*Figure: Predictions Example I*

### Example 2
*Sentence:* _The velocity v_

| **Token**    | **Prediction** | **DistillBERT I** | **DistillBERT II** |
|--------------|----------------|-------------------|--------------------|
| the          | B-NAME         | 0.96              | 0.99               |
| velocity      | I-NAME         | 0.87              | 0.98               |
| v            | B-VAR          | 0.98              | 0.99               |

*Figure: Predictions Example II*


## Discussion
## References

## License








