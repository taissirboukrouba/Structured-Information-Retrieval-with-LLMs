# Model Selection 

# Choosing DistillBERT : 

In the context of my research, and as illustrated in the figure, DistillBERT emerges as the optimal choice for sequence labeling tasks. DistillBERT leverages a base model, specifically the BERT model, which has been pre-trained on vast amounts of textual data and serves as the "teacher" in this setup. To adapt this model to the nuances of my custom physics text, a "student" model is created. This student model undergoes training on the specific dataset, accompanied by its labels, to fine-tune it for the particular domain.

The main objective here is to present both the teacher and the student with the same problem. The student learns by comparing its predictions to those of the teacher, a process known as Knowledge Distillation. This method allows the student to absorb both the general knowledge from the teacher and the specialized knowledge from the specific dataset it is trained on. By combining these two sources of knowledge, DistillBERT achieves enhanced performance, making it particularly well-suited for the specialized task of sequence labeling in this research. Its architecture is shown in the figure below : 


![image](https://github.com/user-attachments/assets/94e53ea0-f6c8-4662-8ffa-9bf7e6d57928)


- For the pre-trainted model i just used the HuggingFace API  to load the DistillBERT model  :

```python
model = DistilBertForTokenClassification.from_pretrained("distilbert-base-uncased",  
                                                          num_labels=4,  
                                                          id2label=id2label,
                                                          label2id=label2id)
```
