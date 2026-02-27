# Stanford Machine Learning (Andrew Ng)

## Overview

This directory contains programming exercises from Andrew Ng's [Machine Learning course](https://www.coursera.org/learn/machine-learning) offered by Stanford University on Coursera. The course covers a broad introduction to machine learning, data mining, and statistical pattern recognition through 8 hands-on exercises implemented in MATLAB/Octave.

## Exercises

| Exercise | Topic | Description |
|----------|-------|-------------|
| **ex1** | Linear Regression | Univariate and multivariate linear regression with gradient descent and normal equations. Predicts housing prices. |
| **ex2** | Logistic Regression | Binary classification with logistic regression and regularization. Covers student admission prediction and microchip QA classification. |
| **ex3** | Multi-class Classification | One-vs-All logistic regression and neural network prediction for handwritten digit recognition (20x20 pixel images). |
| **ex4** | Neural Networks | Backpropagation algorithm, sigmoid gradients, weight initialization, and regularization. Trains a 2-layer neural network for digit recognition. |
| **ex5** | Regularization & Bias-Variance | Learning curves, polynomial regression, and validation curves for hyperparameter tuning. Analyzes bias-variance tradeoff. |
| **ex6** | Support Vector Machines | Linear and Gaussian kernel SVMs. Includes a spam email classifier with text preprocessing and feature extraction. |
| **ex7** | K-Means & PCA | K-Means clustering for image compression and Principal Component Analysis for dimensionality reduction on face images. |
| **ex8** | Anomaly Detection & Recommender Systems | Gaussian-based anomaly detection and collaborative filtering for movie recommendations (1682 movies, 943 users). |

## Technologies

- **MATLAB / Octave** (all exercises use `.m` files)
- **Optimization:** `fminunc` and `fmincg` (conjugate gradient)
- **Data formats:** `.mat` (MATLAB binary), `.txt` (plain text datasets)

## How to Run

1. Install [GNU Octave](https://www.gnu.org/software/octave/) (free alternative to MATLAB)
2. Navigate to an exercise directory (e.g., `cd ex1`)
3. Launch Octave and run the main script:
   ```matlab
   ex1    % or ex2, ex3, etc.
   ```
4. Follow the prompts — each exercise prints results and generates plots

## Directory Structure

Each exercise contains:
- `ex*.m` — Main script that orchestrates the exercise
- `*_solution.m` — Completed solution files
- `lib/` — Supporting libraries (jsonlab for Coursera submission)
- `*.mat` / `*.txt` — Datasets
