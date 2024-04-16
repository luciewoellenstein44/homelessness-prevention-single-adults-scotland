# homelessness-prevention-single-adults-scotland

This repository provides the code, data (synthetic data where appropriate) and visual outputs of a Ph.D. project titled
"An Evaluation of Homelessness Prevention for Single Adults in Scotland using Predictive Modelling on Administrative Data Sets" 
(available here: <insert link>). It does not contain any real data that could identify any of the study subjects. 
Instead it provides a synthetic data set that can be used instead.  

This Ph.D. carried out six analyses in R. 
Each analysis was performed in the same way (same statistical analysis, same visualisations). 
Therefore only one of these is included in this repository as an example. 

The example analysis modelled successful and unsuccessful Housing Options outcomes for single adults in Glasgow between 2014-2021.
(More information on Housing Options here: https://www.gov.scot/policies/homelessness/homelessness-prevention/.) 
The real analysis used the Scottish administrative PREVENT1 data set. A simulated synthetic data set is provided for use here instead.

Successful and unsuccessful outcomes were derived from the final accommodation of the individual following closure of the approach.
They were coded as such: 

**Successful exit:** Remained in current accommodation (if PROPERTY was one of the accommodations in this section), LA tenancy, private rented – assured tenancy, private rented- short assured tenancy, women’s refuge, moved-in with friends/relatives, residen- tial care/nursing home, supported accommodation or Support Housing, tenancy with voluntary organisation other than above, sheltered accommodation, home ownership (low cost HO, shared Ownership, bought own home via other means), shared property – LA, shared property (RSL – housing association), shared property – PRS, lodger

**Unsuccessful exit:** hostel – LA, hostel – RSL, hostel – other, prison, hospital, lost contact with ap- plicant, made homelessness application, remained in current accommodation (if PROPERTY was one of the accommodations in this box or roofless, sofa-surfing or B&B)

### The repository is set up the following way:

**/clean_data/** - This folder contains a simulated synthetic data set (clean_data.csv) of the real PREVENT1 data set that was used.
The real data is not included as it cannot be made open for data sensitivity / confidentiality reasons.
This data set was built using the R package simstudy and is based on the distribution of the real data set, but is fake. 
This folder also contains the data specification for this synthetic data set. 

**/research/explore/** - this folder contains a EDA.Rmd file and descriptive_statistics.Rmd file that can be used to carry out exploratory data analysis and create descriptive statistics tables of the clean_data.csv.

**/research/analysis/** - this folder contains a prediction_models.Rmd file which uses the clean_data.csv to build 6 machine learning models, variable importance measures and model coefficients. 

**/research/visualise/** - this folder contains Rmd files to create various visualisations that were created on the models or data in the Ph.D. All these Rmd files are built on data found in /research/visualise/data/ folder. The data in /research/visualise/data/ is the output data from the real Ph.D. analysis. This data went through statistical disclosure control to ensure that it does not identify anyone. 

**/research/report/** - this folder contains all of the visual outputs from the analysis. 

### Dependencies

```R
# install packages
if (!requireNamespace("caret", quietly = TRUE)) {
  install.packages("caret")
}
if (!requireNamespace("stats", quietly = TRUE)) {
  install.packages("stats")
}
if (!requireNamespace("DescTools", quietly = TRUE)) {
  install.packages("DescTools")
}
if (!requireNamespace("mlbench", quietly = TRUE)) {
  install.packages("mlbench")
}
if (!requireNamespace("glmnet", quietly = TRUE)) {
  install.packages("glmnet")
}
if (!requireNamespace("gbm", quietly = TRUE)) {
  install.packages("gbm")
}
if (!requireNamespace("randomForest", quietly = TRUE)) {
  install.packages("randomForest")
}
if (!requireNamespace("adabag", quietly = TRUE)) {
  install.packages("adabag")
}
if (!requireNamespace("xgboost", quietly = TRUE)) {
  install.packages("xgboost")
}
# install.packages("fastAdaboost") - this package has been removed from CRAN - now available in archive
# download here: https://cran.r-project.org/src/contrib/Archive/fastAdaboost/ 
if (!requireNamespace("fastAdaboost", quietly = TRUE)) {
  install.packages("path/to/locally/downloaded/archived/fastAdaboost")
}
if (!requireNamespace("pROC", quietly = TRUE)) {
  install.packages("pROC")
}
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}
if (!requireNamespace("GGally", quietly = TRUE)) {
  install.packages("GGally")
}
if (!requireNamespace("tidymodels", quietly = TRUE)) {
  install.packages("tidymodels")
}
if (!requireNamespace("ConfusionTableR", quietly = TRUE)) {
  install.packages("ConfusionTableR")
}
if (!requireNamespace("praznik", quietly = TRUE)) {
  install.packages("praznik")
}
if (!requireNamespace("gridExtra", quietly = TRUE)) {
  install.packages("gridExtra")
}
if (!requireNamespace("grid", quietly = TRUE)) {
  install.packages("grid")
}
if (!requireNamespace("broom", quietly = TRUE)) {
  install.packages("broom")
}
if (!requireNamespace("inspectdf", quietly = TRUE)) {
  install.packages("inspectdf")
}
if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}
if (!requireNamespace("infotheo", quietly = TRUE)) {
  install.packages("infotheo")
}
```