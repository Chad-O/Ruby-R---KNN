# KNN Implementation in R and Ruby

## Overview

This project demonstrates the implementation of the K-Nearest Neighbors (KNN) algorithm in both R and Ruby. The project involves preprocessing and transforming the provided "obesitydatasetraw" dataset to make it suitable for the KNN algorithm. The dataset undergoes one-hot encoding and standardization where necessary.

## Dataset

The dataset used in this project is "obesitydatasetraw". It includes various features that required preprocessing to be used effectively with the KNN algorithm.

## Preprocessing

1. **One-Hot Encoding**: Categorical features in the dataset were transformed using one-hot encoding. This process converts categorical variables into a form that can be provided to machine learning algorithms to do a better job in prediction.

2. **Standardization**: Features were standardized between 0 and 1 wherever necessary. Standardization helps in normalizing the range of independent variables or features of data.

## Project Structure 

.
├── Ruby/R Knn\
│ ├── data.csv\
│ ├── distribution.png\
│ ├── explanation.pptx\
│ ├── RawData\
│ ├── RKnn.Rmd\
│ └── RubyKnn.rb\
└── README.md

### R

Ensure you have the following libraries:
- "class"
- "tidyverse"
- "datos"
- "car"
- "dplyr"

### Ruby

Ensure you have the following libraries:
- "csv"
- "matrix"
