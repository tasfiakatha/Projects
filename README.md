# Should this loan be approved or denied?

![loan image](https://img.freepik.com/premium-photo/businessman-shaking-hands-giving-dollar-bills-corruption-bribery-business-manager-deal-contract_45041-198.jpg?w=826)

## Authors
[@tasfiakatha](https://github.com/tasfiakatha)

## Table of contents
- [Business problem statement](https://github.com/tasfiakatha/Should-this-loan-be-approved-or-denied-/blob/main/README.md#business-problem-statement)
- [Data source](https://github.com/tasfiakatha/Should-this-loan-be-approved-or-denied-/blob/main/README.md#data-source)
- [Methods](https://github.com/tasfiakatha/Should-this-loan-be-approved-or-denied-/blob/main/README.md#methods)
- [Quick look at the results](https://github.com/tasfiakatha/Should-this-loan-be-approved-or-denied-/blob/main/README.md#quick-look-at-the-result)
- [Takeaways](https://github.com/tasfiakatha/Should-this-loan-be-approved-or-denied-/blob/main/README.md#takeaways)
- [Contribution](https://github.com/tasfiakatha/Should-this-loan-be-approved-or-denied-/blob/main/README.md#contribution)
- [License](https://github.com/tasfiakatha/Should-this-loan-be-approved-or-denied-/blob/main/README.md#license)

## Business problem statement
Small businesses are the backbone of the U.S. economy, driving job creation and innovation. The U.S. Small Business Administration (SBA) plays a vital role in supporting these businesses by providing loan guarantees. However, approving these loans can be a complex process, requiring lenders to balance the need to support small businesses with the risk of default.

This project aims to develop a machine learning model to assist lenders in the SBA loan approval process. The model will be trained on historical data to predict the likelihood of a loan being repaid (approved) or defaulting (denied). This will enable lenders to make more informed decisions, promoting responsible lending practices while facilitating access to capital for qualified small businesses.

This approach offers several potential benefits:

- **Increased Efficiency:** Streamline loan assessment by providing a data-driven prediction of loan success.  
- **Reduced Risk:** Improve loan portfolio quality by identifying high-risk applications.  
- **Greater Access to Capital:** Allow lenders to confidently approve loans for qualified small businesses that might otherwise be denied.

## Data source
- [Small Business Administration (SBA) loan approval dataset](https://www.kaggle.com/datasets/mirbektoktogaraev/should-this-loan-be-approved-or-denied)

## Methods
- Exploratory data analysis
- Feature engineering
- Categorical encoding
- Feature scaling
- Model training
- Model evaluation and selection
- Hyperparameter tuning
- Model interpretation (feature importance and shapley values)

## Quick look at the result
Confusion matrix of decision tree model 

![decision tree confusion matrix](https://github.com/tasfiakatha/Should-this-loan-be-approved-or-denied-/blob/main/artifacts/confusion%20matrix_decision%20tree.png) 

Permutation feature importance of decision tree model

![permutation feature importance](https://github.com/tasfiakatha/Should-this-loan-be-approved-or-denied-/blob/main/artifacts/permutation%20feature%20importance.png)

Shapley value plot

![shapley value plot](https://github.com/tasfiakatha/Should-this-loan-be-approved-or-denied-/blob/main/artifacts/shapley%20value%20plot.png)

Model performance summary:
| Model               | F1 Score |
|---------------------|----------|
| Decision Tree       | 0.886    |
| Random Forest       | 0.875    |
| Logistic Regression | 0.84     |
| LightGBM            | 0.79     |
| GBM                 | 0.65     |
| GLM                 | 0.54     |

- The final model used for this project: Decision tree
- Metrics used: F1 score
  
**Why choose F1 score as the metric?**

I used the F1 score to evaluate my SBA loan approval prediction model because it provides a balanced measure of the model's performance, especially in the presence of imbalanced classes. The F1 score is the harmonic mean of precision and recall, which helps to ensure that both false positives and false negatives are taken into account. 

In the context of loan approval prediction, it is crucial to accurately identify approved and rejected loans to minimize financial risks and maximize customer satisfaction. Precision tells me how many of the predicted approved loans were actually correct, while recall indicates how many of the actual approved loans were correctly identified by the model. By focusing on the F1 score, I can ensure that my model maintains a good balance between these two metrics, rather than optimizing for one at the expense of the other.

Given that an imbalanced dataset is common in loan approval scenarios—where the number of approved loans might significantly differ from the number of rejected loans—the F1 score is particularly useful. It helps me to avoid the pitfalls of accuracy, which might be misleading in such cases, and provides a more comprehensive evaluation of my model's performance. 

## Takeaways
Based on the analysis of this project, the three most predictive features in determining whether a business will be approved for an SBA loan are the loan term length, the bank issuing the loan, and the state where the bank is located. These features play a crucial role in the model's ability to accurately predict loan approval outcomes.

Additionally, other features such as the business's location (urban or rural) and whether it has a revolving credit line also contribute valuable insights to the prediction model. These factors help refine the model's predictions by providing context about the business's operating environment and financial flexibility.

Conversely, some features have been identified as less useful in predicting loan approval. Specifically, the type of outstanding balance and participation in the Low Doc Loan Program do not significantly enhance the model's predictive accuracy. These features have a minimal impact on the approval decision and therefore, contribute less to the overall performance of the prediction model.

Overall, focusing on the most predictive features while acknowledging the supportive role of other helpful features can improve the model's effectiveness and provide better insights into the loan approval process.

## Contribution
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change or contribute.

## License
MIT License

Copyright (c) 2024 Tasfia Katha

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Learn more about [MIT](https://choosealicense.com/licenses/mit/) license

