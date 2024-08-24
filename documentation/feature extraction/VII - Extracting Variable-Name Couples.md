# Extracting Variable-Name Couples

Following the cleaning of the dataframe, I will now define a function to extract variable-name compounds, which are categorized into two main types:
  - **Single Variable Sentences:**
   This category pertains to sentences containing only one variable, which accounts for the majority of cases. I have further subdivided this category into three sub-types:
<div align="center">

   | **Sub-type**        | **Explanation**                                         |
   |---------------------|---------------------------------------------------------|
   | Variable Beginning  | Refers to variables found at the start of a sentence.  |
   | Variable Middle     | Refers to variables located in the middle of a sentence.|
   | Variable End        | Refers to variables found at the end of a sentence.    |
   
</div>


-  **Multiple Variable Sentences:**
   This category includes sentences with two or more variables. For simplicity, the focus is on sentences with exactly two variables separated by "and". 



## Single Variable Sentences : 

### I - Variable Beginning : 

As explained previously , this is specific to when the variable is found at the beginning of the sub-sentence. The process goes through list of sub-sentence tokens and if a token is labeled as `MATH\_VAR` and found at index of 0 (beginning) then it would be considered for this process , else it would be ignored and it moves into the next sentence. The next step is to check some conditions that help extract the variable and its name. Since the variable is first , it would be the subject (a Noun in POS) and a variable can only defined using a verb which is the condition to be met ( that a verb should be directly after the variable). If this condition is matched i need to know if there is either a noun or the determinant `the` which are the usual starts of a variable name definition. if any of those 2 conditions match i return the variable and its name. The following diagram will give a clearer explanation : 


<p align="center">
  <img src="https://github.com/user-attachments/assets/43872e8e-2cc7-4320-8e2e-69940b63b042" alt="var-begin-diag" width="700"/>
</p>


### II - Variable Middle : 

I considered the verb to be in the middle if it's at least 2 indices before the end ( and naturally with the condition of not either being at the end or beginning index). Now that the sub-sentence token is confirmed to be a mathematical variable and in the middle of the tokenised sentence , i can start the process.

After this variable if there is a verb followed by a noun or the determinant `the` then i extract the variable and its name else i get any noun phrase whether before or after the variable and consider it as  the variable's noun. this case is not as common as the other two cases , which are far more important. To better comprehend this pipeline and code , let's consider the following cases of middle variables explained in the diagram below  :


<p align="center">
  <img src="https://github.com/user-attachments/assets/db9fb857-23ab-4e62-94de-dbecbc7014d7" alt="var-mid-diag" width="500"/>
</p>


### III - Variable End : 

Now i will consider the most common cases of them all , which is when the variable is at the end of the sub-sentence , this means after going through sub-sentence tokens , the token labeled as a mathematical variable was found at the last index. First , the pipeline checks if there is a verb or a noun before the target variable. If yes , it checks next if there is a determiner `the` in the tokenised sub-sentence if not checks if there is a noun. Then , finally it returns the variable with its name as shown in the following diagram below : 


<p align="center">
  <img src="https://github.com/user-attachments/assets/bcce863a-676a-4346-8dd1-4cee7d619eda" alt="var-end-diag" width="500"/>
</p>


## Multiple Variables Sentences : 

If a sub-sentence contains more than one token labeled as `MATH_VAR`, it indicates a case involving multiple variables. During this process, we check for the presence of the conjunction "and", which serves as a key indicator of multiple variable names. There are two primary cases to consider:

1. **One Connection Clause (CC):** 
   In this scenario, a single "and" separates two variables. This implies that the first variable is followed by "and", which then precedes the second variable. For example:
   <p align="center" style="font-size:18px;"><i>The variable1 x and the variable2 y</i></p>

   Here, `and` connects the two variables directly, helping us to determine the boundaries of each variable's name.

2. **Two Connection Clauses (CC):**
   This case involves two occurrences of "and" separating the variables and their corresponding names. For instance:
      <p align="center" style="font-size:18px;"><i>x and y are name1 and name2</i></p>
   
   In this instance, the first and second variables are separated by the first `and`, while their respective names are separated by the second `and`.

### Handling Connection Clauses

- **For One Connection Clause (CC):** 
  - Locate the index of "and".
  - Identify the indices of both variables.
  - Extract the name of the first variable from the position immediately after the variable index up to the "and".
  - Extract the name of the second variable from the position immediately after "and" to the end of the sentence.

- **For Two Connection Clauses (CC):**
  - Determine the index of the first "and" and extract the variables located between this and the second "and".
  - Identify the index of the second "and" and extract the names located between this and the end of the sentence.

The following diagram and code section provide a detailed explanation of these processes and illustrate how the extraction is performed. Please refer to the visual aids and code examples below for a comprehensive understanding.

<p align="center">
  <img src="https://github.com/user-attachments/assets/7caccfeb-b00d-4e9d-8c41-49e07adc24c5" alt="mult-var-diag" width="700"/>
</p>




