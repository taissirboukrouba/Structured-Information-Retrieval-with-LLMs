# Structured Information Retrieval with LLMs

- **Author(s):** Taissir Boukrouba
- **Affiliation:** University of Hertfordshire   
- **Date:** 09/2024

---

## Table of Contents

- [Introduction](#introduction)
- [Background](#background)
- [Installation](#installation)
- [Usage](#usage)
- [Methodology](#methodology)
- [Results](#results)
- [Discussion](#discussion)
- [Contributing](#contributing)
- [License](#license)
- [Ethical Considerations](#ethical-considerations)
- [References](#references)

---

## Introduction

Knowing the importance of research papers and the huge amounts of its unstructured data that is submitted to the web , makes it a very prominent problem . Significant insights has been left as brute text in these papers that makes it not easily accessible. The aim of this project is to compare the ability of several LLMs  to extract variables and their names from physics research papers. This task is called sequence labelling where a sentence is given and each of its token is categorised into the convenient class. A collection of papers collected from Arxiv ,  an open-access repository for research papers, particularly in the fields of physics, mathematics and computer science. The data is in the format of PDFs which was transformed into text using python PDF to text translation tools. Data preprocessing techniques special for NLP are used to clean the text , which was later put in a feature extraction pipeline using different grammatical tools such as POS and NER  to extract and create a dataframe of variables and their names. The result data which had two iterations (one with 300 rows and the second with 2K rows) is to be trained on two different types of models , one is pre-trained (DistillBERT) and the other is from scratch (Encoder-only Transformer). 

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

## Ethtical Considerations 
