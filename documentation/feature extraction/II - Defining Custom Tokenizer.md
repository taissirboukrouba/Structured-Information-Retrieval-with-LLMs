# Defining Custom Tokensier 

Because of the bad formatting of the documents and the non-effectiveness of the default tokenizer that SpaCy provides , I'm going to create my own custom tokenizer. The problem with the default tokenizer is that it fails to correctly tokenizer functions without splitting them into multiple parts and this can be counter-productive when extracting variables which these functions are part of. This explains the need of the previous definition of weak labels which will be integrated in this process. 

What my custom tokenizer is going to do is to first identify these functions with the use of the pre-defined regex expression (the ones i went through previously) , then replace these functions with a temporary tag or stamp `[FUNC]` that would be later replaced with their original values after applying the default tokenization.The reason that these tags are not split improperly during the normal tokenization lies behind how they work. Default tokenizers come with pre-defined rules that handle punctuations , special characters and many more. These ensure that specific markers like `[FUNC]` are recognised as full units instead of being split. In that way , if i left the function i get passed to the default tokenizer they would split anyway , and the whole process would be unnecessary. Now defining the custom tokenizer will help ensure that all these functions i've identified are split properly and hence identified later properly. 

> [!IMPORTANT]  
> The custom tokeniser is found in the [feature extraction notebook](notebooks/feature_extraction.ipynb) under the function's name `my_tokenizer()`

**Example :** I get the following results by applying this tokenizer on this sentence : 

<p align="center" style="font-size:18px;"><i>we deﬁne the ﬂow at the surface by U(x), z = 0...</i></p>


![custom-tokenizer-test](https://github.com/user-attachments/assets/6c94eeaa-e248-4d0a-bc4e-3400c9c4e186)
