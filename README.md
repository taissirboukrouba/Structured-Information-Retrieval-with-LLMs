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
In [Cornel’s University Privacy Principles](https://privacy.cornell.edu/privacy-cornell/privacy-principles-cornell) "Support for US and International Data Privacy Standards" and [ArXiv’s Privacy Policy](https://info.arxiv.org/help/policies/privacy_policy.html)  "Special Notice for EU Residents" sections mention and acknowledge GDPR requirements where they list principles like Notice, Data Integrity, Purpose Limitation, Access, and Security, which corresponds to GDPR rules (creating, maintaining, using or disseminating personal data must take "reasonable and appropriate" security measures)

The [UH policy](https://www.herts.ac.uk/research/research-management/ethics-and-research-integrity) focuses on the integrity of the research itself, not necessarily the platform (ArXiv). This project does not violate any copyright infringements or data fabrication (all data uploaded to ArXiv is verified by its moderators). 

Under [ArXiv’s terms and submission agreements](https://info.arxiv.org/help/policies/submission_agreement.html) “Grant of the License to arXiv” submitters agree that their submission grants us (content users) a non-exclusive, perpetual, irrevocable, and royalty-free license to include and use their work 

## Background

Describe the theoretical foundation, related work, or previous research that underpins your project. Explain why your work is important in the context of existing research.

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
### II - Data Preparation
### III - Data Preprocessing
### IV - Feature Extraction 
### V - Modelling


## Results 
## Discussion
## References

## License






