# Clustering Algorithms: An Analytical and Computational Exploration

This repository contains the solution and code for the **1st Homework Assignment** of the "Clustering Algorithms" graduate course of the MSc Data Science & Information Technologies Master's programme (Bioinformatics - Biomedical Data Science Specialization) of the Department of Informatics and Telecommunications department of the National and Kapodistrian University of Athens (NKUA), under the supervision of professor Konstantinos Koutroumbas, in the academic year 2023-2024. 

The assignment explores theoretical and computational approaches to clustering using algorithms like **k-means** and **k-medians**, applied to synthetic datasets. The tasks include mathematical proofs, algorithmic derivations, and implementation of clustering methods using MATLAB.

---

## Repository Contents

- **Theoretical Exercises**: Analysis and derivations of clustering cost functions and algorithms, such as hard and possibilistic k-medians.
- **Computational Tasks**: MATLAB scripts implementing and evaluating clustering algorithms on synthetic datasets.
- **Generated Results**: Visualizations and quantitative analyses comparing clustering performance metrics.

### Key Files
- `exercise4a.m` and `exercise4b.m`: Scripts for generating datasets and running k-means/k-medians on basic 2D distributions.
- `exercise5a.m` and `exercise5b.m`: Extensions of clustering with noise and outliers added to the dataset.

---

## Main Workflow and Tools

1. **Dataset Generation**:
   - Synthetic datasets of 2D points generated from multivariate normal distributions with predefined means and covariances.

2. **Clustering Algorithms**:
   - **k-means**: Minimizes squared Euclidean distances.
   - **k-medians**: Minimizes Manhattan (L1) distances, making it robust to outliers.

3. **Visual and Quantitative Analysis**:
   - Points and cluster centers are plotted for each dataset.
   - Representative metrics are compared with true distribution means.

4. **Handling Noise and Outliers**:
   - Additional noisy points are introduced to evaluate algorithmic robustness.

---

## Results Overview
- Visualization of cluster assignments and centers.
- Quantitative comparison of representative means to true cluster centers.
- Evaluation of robustness to outliers and initialization strategies.

---

## Cloning the Repository
To clone this repository, run the following command in your terminal:
```bash
git clone https://github.com/GiatrasKon/Clustering_Algorithms_Analytical_and_Computational
```

## Prerequisites

- MATLAB installed on your system.

## Usage Instructions

1. Open MATLAB.
2. Navigate to the cloned repository folder.
3. Run the desired MATLAB scripts (`exercise4a.m`, `exercise4b.m`, etc.) to generate datasets, run clustering algorithms, and visualize results.
4. Modify dataset parameters (e.g., number of points, distributions) within the MATLAB scripts for custom experiments.
5. Execute scripts in MATLAB for automated clustering and visualization.

## Documentation

Refer to the `documents` directory for the assignment description and report.

---