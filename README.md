#FDIC-Failed-Bank-List

Problem Statement:
Since October 2000, numerous banks in the United States have failed, often leading to economic instability, financial losses, and regulatory intervention. The Federal Deposit Insurance Corporation (FDIC) serves as the appointed receiver for failed banks, yet predicting bank failures remains a critical challenge for financial institutions, regulators, and investors. This project aims to analyze historical bank failures to identify key financial, economic, and operational indicators that contribute to institutional collapse. By leveraging machine learning, statistical modeling, and economic analysis, the project seeks to develop predictive frameworks that can provide early warning signals, mitigate risks, and enhance regulatory oversight. Additionally, this study will examine the impact of macroeconomic factors such as interest rates, inflation, and economic downturns on the probability of bank failures, offering actionable insights for financial policymakers and industry stakeholders. The dataset that would be utilized in order to present these insights would be coming from https://catalog.data.gov/dataset/fdic-failed-bank-list

📌 Executive Summary
This project presents a Power BI dashboard that analyzes patterns in U.S. bank failures, focusing on fund distribution, closure trends, and institutional acquisitions. Drawing data from a structured SQL Server connection, the report integrates interactive visuals to help users explore which states, cities, and acquiring institutions have been most impacted.
The goal is to support data-driven risk identification, show temporal and geographic closure behavior, and help identify acquisition concentration. Despite the narrow range of Fund values in the dataset, the dashboard pivots to value-added analyses including YoY trends, acquirer profiling, and geographic mapping.

🔍Overview of Findings

Monthly Closures Trend
- Peak failures occurred between 2008 and 2010, coinciding with the global financial crisis.
- A clear downward trend in closures post-2012, suggesting systemic recovery.
- Year-over-year analysis highlights intermittent spikes aligned with economic stress events.

![image](https://github.com/user-attachments/assets/21c5e2c2-50e0-4695-a7e0-e69850d7cd40)

![image](https://github.com/user-attachments/assets/b873a66e-f16b-4dda-ad9e-18805597d0bb)


Map of State Closures
- States like Georgia, Florida, and Illinois exhibited the highest closure counts.
- Some states incurred larger total fund losses despite fewer closures, indicating higher per-bank exposure.
- Regional clustering suggests economic or regulatory influences

![image](https://github.com/user-attachments/assets/db0f6a14-af91-428a-a12e-486920289fa8)

Top Acquirers
- A small subset of institutions account for the majority of acquisitions, creating a consolidation pattern.
- Fund absorption analysis reveals which institutions inherited the largest liabilities
- It seems majority of the banks were not acquired by anyone

![image](https://github.com/user-attachments/assets/58ea91a2-d97f-412f-90e2-208e7dd6f306)

PCA Cluster Plot
- Principal Component Analysis (PCA) combined with K-means clustering in R identified three distinct closure profiles.
- Clusters were characterized by fund magnitude, acquisition history, and state impact level.

![image](https://github.com/user-attachments/assets/d6890974-71c4-42f8-80a5-730d6d5f0794)


🎯 Project Goals
- Analyze closure trends over time (monthly, yearly)
- Map geographic distribution of bank failures and associated funds
- Profile acquiring institutions based on volume and fund absorption
- Explore fund distributions by state and risk tiers
- Enable drillthrough for granular investigation at the bank level

🔧 Tools & Technologies
- Power BI Desktop – dashboarding and interactive reporting
- SQL Server – data source connection and query operations
- DAX (Data Analysis Expressions) – custom KPIs and time intelligence
- R (optional) – used for PCA + clustering in pre-modeling analysis

📊 Data Fields Used
Key columns from the BankFailures dataset:
- Name_Bank, City, State_US, Cert_Num
- Acquiring_Institution, Fund, bank_closing_date

  ![image](https://github.com/user-attachments/assets/2f6172b6-5096-45cb-ab54-fb6e5d1f796b)

Structure in SqlSever

📁 Report Structure
- Executive Overview – KPIs, trendlines, quick filters
- Geographic Breakdown – closures by city/state, fund heat maps
- Time & Seasonal Trends – monthly closure counts, YoY changes
- Acquirer Insights – top acquiring institutions by count and fund
- Risk & Fund Distribution – custom bins and fund-to-closure analysis
- Drillthrough Detail – searchable table of each closure with metadata

📌 Key Insights
- 📈 Spike in closures observed during specific economic years (e.g., 2008–2010), confirmed via monthly time-series and YoY change visuals.
- 📍 State-level clustering reveals high closure frequency in select states—suggesting regional economic vulnerabilities.
- 🏦 A few institutions account for most acquisitions, indicating potential consolidation of failed banks into a limited number of larger players.
- 🔍 Despite low variation in Fund values, visual strategies like heatmapping and institutional aggregation successfully elevate interpretability.

🚀 Future Enhancements
- Integrate macroeconomic indicators (e.g., unemployment rate, GDP) for predictive modeling
- Use external API to pull in active FDIC bank metrics for benchmarking
- Layer clustering results from R into Power BI as tag-based insights
- Enable bookmark navigation for guided exploration across user personas



