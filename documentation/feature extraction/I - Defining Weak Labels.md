# Defining Weak Labels 

Weak labels are semi-automated annotations that, while not as precise as strong labels, play a crucial role in automating the large-scale data annotation process. These labels are particularly useful when dealing with extensive datasets where manual annotation would be impractical or time-consuming. One common method for generating weak labels is through the use of regex patterns, which can identify specific patterns or features within the data.

In this context, I am utilizing regex patterns to extract mathematical variables, with a focus on identifying functions within these documents. The use of weak labels at this stage will significantly streamline the subsequent steps in the pipeline, ensuring that the data is pre-annotated and ready for further processing.

Specifically, the process involves defining regex patterns that are capable of detecting a wide range of mathematical functions, whether they involve single variables, two variables, or even more complex multi-variable expressions. By implementing these patterns, we lay the groundwork for accurately identifying and categorizing mathematical functions, which will be critical as we move forward in the pipeline.

This approach not only enhances the efficiency of the annotation process but also ensures that the data is prepared for more refined analysis in later stages.




This regex expression defined in the [feature extraction notebook](notebooks/feature_extraction.ipynb)  assumes that a function's name (**func_name**) can consist of 1 to 3 characters maximum and that the variables inside (**func_var**) can be one or more. The function's name includes not only regular characters but also various mathematical symbols and characters. Due to limitations with LaTeX, these symbols are not fully represented in this document. For the complete code and details, please refer to the original code on GitHub.

Examples of such functions include, but are not limited to, the following:

- `f(x)`
- `G(x,y)`
- `T(a,b,c)`
- `A_1(x,w,y,z)`

...and more.



