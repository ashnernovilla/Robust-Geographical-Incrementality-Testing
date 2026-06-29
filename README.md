# **Robust Geographical Incrementality Testing**

**An Ensemble Approach Integrating Machine Learning and Structural Equation Modeling**  
This repository contains the codebase for a multi-stage causal framework that integrates observational causal discovery with density-based stratification and triangulated causal estimation. By bridging applied computing and strategic execution, this end-to-end ecosystem allows strategic media planners to launch mathematically sound financial experiments without manual interference.

## **Table of Contents**

1. [Project Overview](#bookmark=id.5kehtodg3b92)  
2. [The Measurement Challenge](#bookmark=id.ivlatw4okew9)  
3. [Methodological Objectives](#bookmark=id.8tymsrjx0ftw)  
4. [System Architecture & Workflow](#bookmark=id.1kptxetc7k3c)  
5. [Repository Structure](#bookmark=id.j1e82gfs1cd)  
6. [Execution Manual](#bookmark=id.tm4izy7kdpdc)  
7. [Significance & Generalizability](#bookmark=id.ut9kpfjvymbc)

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
* **Statistical Feasibility:** Simulate a synthetic intervention to compute the Minimum Detectable Effect (MDE) against pre-determined thresholds (![][image1], power \= ![][image2]).  
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

* Econometric outputs are translated into executive-ready visual waterfalls and cumulative lift charts via a zero-touch Gradio UI embedded directly into the notebook.  
* The final ROI is instantly verified, closing the loop from causal hypothesis to financial return.

## **Repository Structure**

The entire pipeline, including data processing, model execution, and the user interface, has been consolidated into a single Jupyter Notebook for ease of use and rapid deployment.  
├── data/                                      \# (Optional) Directory for your raw datasets  
├── Match Market Geo Experiment June2826.ipynb \# Core notebook containing the entire ecosystem  
└── docs/                       
    └── README.md                              \# System instruction manual (this file)

## **Execution Manual**

### **1\. Environment Setup**

This notebook is heavily optimized for execution in **Google Colab**. It leverages Colab-specific output rendering and environment configurations.

1. Upload Match Market Geo Experiment June2826.ipynb to Google Colab.  
2. (Optional) Store your OpenAI API key in Colab's secret manager under the name SEM\_OpenAI for the automated causal explanations.

### **2\. Dependency Installation**

The notebook handles its own complex dependency installations (including Google's matched\_markets, bazel, semopy, and lingam).

1. Run the first cell: \# @title Dependency Installation.  
2. **Important:** Because this cell installs underlying system packages, it is programmed to **automatically restart your session** once complete.  
3. You will see a printout stating: "Packages Installed. Restart Session \- Click Run All Again...". After the session automatically restarts, you can safely run all the cells.

### **3\. Launching the App / Pipeline**

Once dependencies are installed, run all remaining cells in the notebook.

* The final cell (\# @title Deployment App) will launch a zero-touch **Gradio application** inline within the notebook output.  
* You can interact with the app directly in the notebook or click the generated public URL to open it in a full-screen browser tab.

### **4\. Using the Interface**

The Gradio application will walk you through the 4-phase ecosystem:

* **Tab 1: Pre-Test Design (SEM & Discovery):** Upload your time-series CSV/Excel data here to run Auto Causal Discovery (LiNGAM) or build your SEM model to generate causal priors.  
* **Tab 2: Pre-Test Planning:** Execute the DBSCAN Cluster Outlier Analysis, set your budget constraints, and run the Match Market Analysis to generate validated pairs.  
* **Tab 3: Post-Planning Result Analysis:** Upload post-test data to evaluate the synthetic vs. actual lift using the triangulated model approach.

## **Significance & Generalizability**

This project fundamentally advances modern marketing science by bridging correlational Media Mix Modeling with rigorous experimental lift studies. By constraining the greedy matching algorithm within density-based cohorts, the framework formally neutralizes the treatment effect heterogeneity problem.  
Furthermore, the integration of a methodological triangulation approach moves the industry away from fragile single-point estimates toward a highly credible, consensus-based causal inference standard. This ensures a verified signal detection capability, drastically reducing the risk of misallocating multi-million dollar budgets due to unobserved market noise.

[image1]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE0AAAAaCAYAAADygtH/AAAB0ElEQVR4Xu2XjU3EMAxGMwMrMAMrsAIr3AqswAaMwAhswAZscAvcANCn3ldyxm5SdNdSyU+y1CZpHH9xflpKkiRJkuyAw2BvZ3sydT3cD/ZsCyseB3sd7L3Mt9sNCPVZxsAxnilrgRAvZRTia7CPy+oJJuRUxvZ35ccfz7uEQAgYsQTPlFE3B/VkzUOJRUMYBEO4mmMZBd8lzDoBWyjryTYRiYZY3gTQFuG6YWbojL1j6xRl4JFonggRUXtNiiea5/cXCERj9gAEIz1JXUQEloXt/NZEwVLeFdSZqJ9IHJXPxotg3gaLgEpTThcJ6IEDnC2xeq/yiIL9F6IpTe1yJNso16m1NlGwm4um04isskg0OjmYujXAtzdZ1xbNJktTNB3r3hGLUJFDC47pa4nZwVqiTOgdk4jaKymsOJHfCYlmP4S5Ogv7HYNYYi3R2Ee9wVNGndCERUSiceB58dHWy/AJXfDs7wMd1WnKMm4FeW28i6wCrQ8R3fptDCISDY7lcpURI+2b2xGD4mNmjw5woExAcd6xtUUDBq9be/1co4ys/0u1SjyrYYXQJ/HyvXeLmAVH3rWiZ/+5JfrhRqzWNeUvEBt967crSZIkSZJka74BPL2y6YUniu8AAAAASUVORK5CYII=>

[image2]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACUAAAAZCAYAAAC2JufVAAABfUlEQVR4Xu2VUXEDMQxEjaEUiiEUSqEUSqEUyiAQCqEMyiAMQiAAWr/k9majSOePTicf8ZvRxLmTpbVk+1qbTB6Mp27v3b667bvtrl9v8tzto9v38sv/jLdun4u9hnc3IOjQLs6MX7qd2iXICMQjhiTM4/e4jB1ikwPBmPKVsDoCOQhCGCK3oLJx1cwlqUDgT7uuIGOeRfErCGK1jgKNqoVPFKVKCyqCX4RnabWkuBJFFbegIghgPwr2JCZYdCUq5j1TJdfzdJJBlfCTL3Foqbe9iqN5N/xVFLiwLFYV599EcfpoD8JomRL5XqniDEX5HvDnWTBBi9hPfoIYaw/prmPsp1GUoiBLXlXQiUdfSKzmEjtLnuVdIXB8KVF+3DmpftNz4jJRQDxEg9oayTq0wuR4UeJMGxx8vC2IjO0D3nu87KLU4ag+SWf0GcCZshM0fv90J3kgLYj5zGMx+MW58uPXx0MIRGCEjT4vDr5ajLc7wmJoOWI2KzSZTO7BLx9IidRiAuIyAAAAAElFTkSuQmCC>