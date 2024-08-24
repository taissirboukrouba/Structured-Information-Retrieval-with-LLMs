# Model Selection 

## Choosing DistillBERT : 

In the context of my research, and as illustrated in the figure, DistillBERT emerges as the optimal choice for sequence labeling tasks. DistillBERT leverages a base model, specifically the BERT model, which has been pre-trained on vast amounts of textual data and serves as the "teacher" in this setup. To adapt this model to the nuances of my custom physics text, a "student" model is created. This student model undergoes training on the specific dataset, accompanied by its labels, to fine-tune it for the particular domain.

The main objective here is to present both the teacher and the student with the same problem. The student learns by comparing its predictions to those of the teacher, a process known as Knowledge Distillation. This method allows the student to absorb both the general knowledge from the teacher and the specialized knowledge from the specific dataset it is trained on. By combining these two sources of knowledge, DistillBERT achieves enhanced performance, making it particularly well-suited for the specialized task of sequence labeling in this research. Its architecture is shown in the figure below : 

<p align="center">
  <img src="https://github.com/user-attachments/assets/94e53ea0-f6c8-4662-8ffa-9bf7e6d57928" alt="distillbert-arch" width="500"/>
</p>


- For the pre-trainted model i just used the HuggingFace API  to load the DistillBERT model  :

```python
model = DistilBertForTokenClassification.from_pretrained("distilbert-base-uncased",  
                                                          num_labels=4,  
                                                          id2label=id2label,
                                                          label2id=label2id)
```

## Choosing Encoder-only Tranformer : 

For the scratch model, I opted to implement a classic transformer architecture, which is based on the principles outlined in the foundational transformer model. This architecture is well-regarded for its ability to handle a variety of NLP tasks efficiently. In this specific implementation, I focused solely on the encoder component of the transformer, as it is more suitable for sequence labeling tasks.

<p align="center">
  <img src="https://github.com/user-attachments/assets/353dfd53-1d81-4d13-8ec6-654d86b8fd7b" alt="transformer-arch" width="400"/>
</p>


The traditional transformer model consists of both an encoder and a decoder. However, since sequence labeling does not require the generation of sequences (which is the primary role of the decoder), the decoder component was excluded from this implementation. By utilizing an encoder-only transformer, the model can focus entirely on understanding and processing the input sequences, which aligns perfectly with the goals of sequence labeling.

The encoder in this architecture operates through multiple layers of self-attention mechanisms and feed-forward neural networks, allowing it to capture complex dependencies within the input data. This design enables the model to learn the relationships between tokens in the sequence, making it well-suited for tasks such as identifying named entities, classifying parts of speech, or any other form of sequence labeling. The full selected architecture is defined in `SeqLabTransformer()` and summarised in the following table : 

<div align="center">


| **Parameter**   | **Value**                  |
|-----------------|----------------------------|
| **model_dim**   | 768 (inspired by BERT)      |
| **num_labels**  | 4                          |
| **num_heads**   | 8 attention heads          |
| **num_layers**  | 6 encoder layers           |
| **feedf_dim**   | 2048                       |


</div>
