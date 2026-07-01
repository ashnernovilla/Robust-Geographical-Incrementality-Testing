# **Robust Geographical Incrementality Testing**

**An Ensemble Approach Integrating Machine Learning and Structural Equation Modeling**

This repository contains the codebase for a multi-stage causal framework that integrates observational causal discovery with density-based stratification and triangulated causal estimation. By bridging applied computing and strategic execution, this end-to-end ecosystem allows strategic media planners to launch mathematically sound financial experiments without manual interference.

## **Table of Contents**

1. [Project Overview](#bookmark=id.w2azeb2ovu0)  
2. [The Measurement Challenge](#bookmark=id.97wctevpfnsk)  
3. [Methodological Objectives](#bookmark=id.2sq3rtcymfo5)  
4. [System Architecture & Workflow](#bookmark=id.8jrfsado30az)  
5. [Repository Structure](#bookmark=id.w6tv7yrf8eoe)  
6. [Execution Manual (Docker Deployment)](#bookmark=id.d9vt6clfbp3c)  
7. [Significance & Generalizability](#bookmark=id.r728cg9or166)

## **Project Overview**

The digital advertising ecosystem has evolved into a complex, multi-channel environment where measuring true incremental return on ad spend (iROAS) is a central challenge. Traditional methodologies struggle to track complicated customer journeys and often confuse coincidence with causality.

To overcome these observational limitations, this project utilizes randomized geo-based experiments. Rather than matching markets blindly on pre-period trends, this framework constrains the matching process using empirically derived causal priors. This prevents structurally dissimilar markets from being paired, effectively eliminating the massive treatment effect heterogeneity bias that inflates variance and hides true ROI.

## **The Measurement Challenge**

Standard industry practice relies on "greedy" matching algorithms that pair test and control regions based primarily on short-term outcome similarity. This approach introduces critical vulnerabilities:

* **Homogeneity Assumption:** Greedy algorithms assume all markets are fundamentally exchangeable, treating structurally distinct regions as if they behave identically.  
* **Myopic Selection:** These algorithms iteratively select the best control for a treated geo and discard remaining controls, artificially reducing the donor pool.  
* **Variance Inflation:** Pairing incompatible units heavily inflates variance and undermines statistical power.  
* **Negative Weighting:** Applying traditional regression models to staggered rollouts under these conditions can mathematically subtract newly treated geos from already-treated geos, creating negative weights.  
* **Blind Execution:** The lack of rigorous pre-experiment simulations leaves marketing teams blind, resulting in tests that are either underpowered or unnecessarily expensive.

## **Methodological Objectives**

The primary objective of this architecture is to develop and validate a replicable causal framework that reduces matching bias and enhances the precision of incremental lift estimation.

### **Key Deliverables**

* **Causal Pathways:** Estimate a panel Structural Equation Model (SEM) with fixed effects to map causal influence and derive a responsiveness score for each market.  
* **Objective Stratification:** Implement a weighted DBSCAN algorithm using correlation distance to objectively cluster Designated Market Areas (DMAs) based on revenue, visits, and responsiveness priors.  
* **De-biased Matching:** Integrate a constrained greedy matching protocol that operates strictly within DBSCAN-derived cohorts to prevent cross-type mismatches.  
* **Statistical Feasibility:** Simulate a synthetic intervention to compute the Minimum Detectable Effect (MDE) against pre-determined thresholds.  
* **Robust Triangulation:** Triangulate causal lift estimation using a 2-out-of-3 voting rule across Time-Based Regression, Quantile Random Forest, and Bayesian Structural Time-Series.

## **System Architecture & Workflow**

The system operationalizes a linear, five-stage methodological workflow transitioning from discovery to actionable execution.

### **Stage 1: Discovery (Causal Priors)**

* The pipeline utilizes semopy to estimate a panel Structural Equation Model.  
* The model uncovers which media channels dynamically drive revenue, assigning an empirical Responsiveness Score to each geographic market.  
* This allows for the visual validation of causal assumptions before financial budgets are committed.

### **Stage 2: Design (Stratified Matching)**

* A Weighted DBSCAN algorithm naturally groups markets into genuine, homogenous cohorts based on structural identity and historical trajectories.  
* The algorithm isolates volatile outliers as noise.  
* Standard Greedy matching is then executed, but strictly constrained within these density-based cohorts to debias the selection at its core.

### **Stage 3: Validation (Safety Gates)**

* Algorithmic gatekeepers force the design through rigorous validation prior to generating an Execution Playbook.  
* The system executes A/A Placebo tests to ensure baseline equivalence.  
* Autocorrelation is scanned via Durbin-Watson diagnostics.  
* Model drift is actively monitored using Brownian Bridge diagnostics.

### **Stage 4: Analysis (Triangulated Estimation)**

* Following the physical experiment, the system mathematically triangulates the incremental lift to prevent algorithmic bias.  
* Three independent frameworks are deployed: Time-Based Regression, Quantile Random Forest, and Bayesian Structural Time-Series (CausalImpact).  
* This ensemble method ensures robust, decision-ready confidence intervals.

### **Stage 5: Recommendation & Export**

* Econometric outputs are translated into executive-ready visual waterfalls and cumulative lift charts via a zero-touch Gradio UI.  
* The final ROI is instantly verified, closing the loop from causal hypothesis to financial return.

## **Repository Structure**

The entire pipeline has been transitioned from a notebook environment into a production-ready, containerized application using Docker.

├── app.py                       \# Core Python application and Gradio UI  
├── Dockerfile                   \# Container blueprint (Python 3.12 Bookworm \+ system dependencies)  
├── requirements.txt             \# Python package dependencies (with locked versions for stability)  
├── .env                         \# Local environment variables (API keys)  
├── data/                        \# (Optional) Directory for your raw datasets  
└── docs/                        \# Local environment variables (API keys)  
    └── README.md                \# System instruction manual (this file)

## **Execution Manual (Docker Deployment)**

This application is fully containerized to ensure cross-platform consistency and avoid local dependency conflicts. You must have [Docker](https://www.docker.com/) installed on your machine to run this ecosystem.

### **1\. Environment Configuration**

Create a .env file in the root directory of the repository. Add your OpenAI API key to this file to enable the automated causal explanations. Ensure this file is added to your .gitignore to prevent exposing your credentials.

SEM\_OpenAI=sk-your-actual-api-key-here

### **2\. Build the Docker Image**

Open your terminal, navigate to the project directory, and build the Docker image. This process installs the underlying OS dependencies (Graphviz, Bazel, Git) and Python libraries.

docker build \--no-cache \-t my-geolift-app .

### **3\. Launch the Application**

Run the container and map the internal Gradio port to an available port on your host machine (e.g., 14523). The command below also exposes ports for debugging and injects your API key.

docker run \-p 14523:7860 \-p 5678:5678 \-p 8080:8080 \--env-file .env my-geolift-app

### **4\. Access the Interface**

Once the terminal indicates the server is running, open your web browser and navigate to:

**http://localhost:14523**

The Gradio application will walk you through the ecosystem:

* **Tab 1: Pre-Test Design (SEM & Discovery):** Upload your time-series CSV/Excel data here to run Auto Causal Discovery (LiNGAM) or build your SEM model to generate causal priors.  
* **Tab 2: Pre-Test Planning:** Execute the DBSCAN Cluster Outlier Analysis, set your budget constraints, and run the Match Market Analysis to generate validated pairs.  
* **Tab 3: Post-Planning Result Analysis:** Upload post-test data to evaluate the synthetic vs. actual lift using the triangulated model approach.

## **Significance & Generalizability**

This project fundamentally advances modern marketing science by bridging correlational Media Mix Modeling with rigorous experimental lift studies. By constraining the greedy matching algorithm within density-based cohorts, the framework formally neutralizes the treatment effect heterogeneity problem.

Furthermore, the integration of a methodological triangulation approach moves the industry away from fragile single-point estimates toward a highly credible, consensus-based causal inference standard. This ensures a verified signal detection capability, drastically reducing the risk of misallocating multi-million dollar budgets due to unobserved market noise.