# Defining Custom NER

Classifying text into predefined entity categories is a critical task in Natural Language Processing (NLP), commonly known as Named Entity Recognition (NER). Traditional NER models are designed to classify text into broad, general categories such as proper names (PERSON), organizations (ORG), locations (LOC), and others. However, these generic categories fall short when dealing with the specialized task of extracting mathematical variables and their corresponding names from technical documents.

To address this limitation, it is necessary to develop a custom NER model tailored specifically for recognizing mathematical entities. This custom NER will go beyond the standard classifications to accurately identify and label mathematical variables and functions within the text.

The creation of this specialized NER requires a combination of techniques, including the use of weak labels—such as regex expressions—and the identification of mathematical symbols. These tools will facilitate the detection and categorization of mathematical entities, ensuring that they are appropriately labeled for further analysis.

The mathematical entities that will be recognized and categorized by this custom NER include, but are not limited to :

<div align="center">

| **Category**                         | **Examples**                                    |
|--------------------------------------|-------------------------------------------------|
| Mathematical Symbols                 | α, β, θ, etc...                                         |
| Mathematical Operations              | ∑, ∏ , etc...                                           |
| Mathematical Structures              | Functions, Lists, Sets, Vectors                |
| Mathematical Verbs                   | "define", "called", etc...                      |

</div>

> [!IMPORTANT]  
> The custom NER is found in the [feature extraction notebook](notebooks/feature_extraction.ipynb) under the function's name `parsing_math_entities()`

The goal here is not to create my own NLP pipeline from scratch but to build on top of the already established SpaCy pipeline. This is why I used `@spacy.Language.component` to define my own component to be added to the default pipeline. I created several lists of type strings containing mathematical symbols, operations, and verbs that need to be considered. Using the SpaCy `Span` function, I labeled the tokens obtained after text tokenization into the following categories:

<div align="center">

| **Custom Entities** | **Description**                                                                                      |
|--------------|------------------------------------------------------------------------------------------------------|
| `MATH_VAR`   | For variables, symbols, or functions (e.g., α, β, θ, f(x), x, y, etc.)                             |
| `MATH_OPP`   | For operations like ∑, ∏, +, *, etc.                                                                 |
| `MATH_VRB`   | For verbs used to define or present a variable, such as "define", "called", etc.                    |

</div>

Using `add_pipe`, I integrated my custom Named Entity Recognition (NER) component into the original SpaCy pipeline. I placed my custom NER before the standard NER phase to ensure that my custom tokenization is applied to a sample phrase first. As a result, the custom NER processes the data before the SpaCy NER, preventing any overwriting of the custom entity labels.The output of this process is a dataframe showing the results of the custom NER, followed by the SpaCy NER's results.

**Example :** I get the following results by applying the custom  NER on this sentence : 

<p align="center" style="font-size:18px;"><i>"This function denoted as f(x) = k(x,y) and  we have z(x, y,w)..."</i></p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/007c5a57-b14b-48ac-8d1d-a5ba0a62e6b0" alt="entity-test-results" width="200"/>
</p>



