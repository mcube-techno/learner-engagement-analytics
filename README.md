# Learner Engagement & Outcomes Analysis

End-to-end learning analytics project using SQL, Python, and Power BI to analyse learner engagement, completion rates, and outcome patterns across the Open University Learning Analytics Dataset (OULAD) — identifying the key factors that influence learner success and translating data into actionable insights.

---

## Project Objective

This project explores what the data tells us about learner behaviour in online education — when students engage, when they disengage, how assessment performance relates to final outcomes, and which combinations of factors are most associated with withdrawal or failure.

The goal is to demonstrate a full data analysis workflow: from raw data ingestion and cleaning, through exploratory analysis and SQL querying, to a structured Power BI dashboard that communicates findings clearly to a non-technical audience.

---

## Dataset

**Open University Learning Analytics Dataset (OULAD)**
Publicly available at: [https://analyse.kmi.open.ac.uk/open_dataset](https://analyse.kmi.open.ac.uk/open_dataset)

The dataset covers 22 courses, 32,593 students, and spans multiple academic years. It contains anonymised data on student demographics, registration, assessment scores, virtual learning environment (VLE) interactions, and final outcomes.

| File | Description |
|---|---|
| `studentInfo.csv` | Student demographics and final results |
| `studentRegistration.csv` | Registration and withdrawal dates |
| `studentAssessment.csv` | Assessment scores per student |
| `assessments.csv` | Assessment types, weights, and deadlines |
| `studentVle.csv` | Daily clicks on learning materials |
| `vle.csv` | VLE activity types and classifications |
| `courses.csv` | Course length and module information |

---

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python (pandas, matplotlib, seaborn) | Data cleaning, EDA, visualisation |
| SQL | Data querying and aggregation |
| Power BI | Interactive dashboard |
| Jupyter Notebook | Analysis documentation |
| GitHub | Version control and project presentation |

---

## Project Structure

```
├── data/
│   ├── raw/                  # Original OULAD CSV files (unmodified)
│   └── processed/            # Cleaned and transformed data
├── notebooks/
│   ├── 01_student_overview.ipynb        # Outcomes and demographics analysis
│   ├── 02_engagement_analysis.ipynb     # VLE engagement vs outcomes
│   ├── 03_dropout_timing.ipynb          # When and why students withdraw
│   ├── 04_assessment_performance.ipynb  # Assessment scores vs final results
│   └── 05_at_risk_identification.ipynb  # Combined at-risk pattern analysis
├── sql/
│   ├── engagement_summary.sql           # Aggregate engagement by module
│   ├── assessment_thresholds.sql        # Flag students below score threshold
│   ├── withdrawal_by_demographic.sql    # Withdrawal rates by group
│   └── student_activity_ranking.sql     # Rank students by activity level
├── dashboard/
│   └── learner_engagement_dashboard.pbix  # Power BI dashboard file
├── images/
│   └── dashboard_screenshot.png         # Dashboard preview for README
├── reports/
│   ├── Business_Requirements_Document.md
│   └── findings_summary.md              # Key insights and recommendations
├── presentation/
│   └── project_summary.pdf              # One-page recruiter-friendly summary
├── .gitignore
└── README.md
```

---

## Analysis Questions

Each notebook addresses a specific analytical question:

1. **Student Overview** — What are the overall pass, fail, and withdrawal rates across courses and demographic groups?
2. **Engagement Analysis** — How does VLE interaction (clicks) correlate with final outcomes?
3. **Dropout Timing** — At what point in a programme do students typically disengage or withdraw?
4. **Assessment Performance** — How strongly do assessment scores predict final results?
5. **At-Risk Identification** — Which combination of factors is most associated with poor outcomes?

---

## Key Findings

*To be updated as analysis is completed.*

---

## Dashboard Preview

*Screenshot to be added once Power BI dashboard is complete.*

---

## How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/mcube-techno/learner-engagement-analysis.git
   ```

2. Install dependencies:
   ```bash
   pip install pandas matplotlib seaborn jupyter
   ```

3. Place the raw OULAD CSV files in `data/raw/`

4. Run notebooks in order, starting with `01_student_overview.ipynb`

---

## Status

| Component | Status |
|---|---|
| Data ingestion & cleaning | 🔄 In progress |
| Exploratory analysis | 🔄 In progress |
| SQL queries | 🔄 In progress |
| Power BI dashboard | ⏳ Pending |
| Final report | ⏳ Pending |

---

## Author

**Megha Sinha**
[LinkedIn](https://www.linkedin.com/in/megha-sinha-0a3a1a26a/) | mail2megha.tech@gmail.com
