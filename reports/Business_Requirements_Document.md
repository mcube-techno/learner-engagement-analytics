# Business Requirements Document (BRD)

**Project Title:** Programme Health Intelligence: A Learning Analytics Case Study  
**Dataset:** Open University Learning Analytics Dataset (OULAD)  
**Version:** 1.1  
**Date:** June 2026  
**Author:** Megha Sinha  
**Status:** Approved

---

## 1. Project Background

Online education providers manage large, complex student cohorts across multiple modules and academic years. A persistent operational challenge is that learner disengagement, underperformance, and withdrawal are rarely sudden events — they develop gradually and leave measurable signals in platform data long before they become visible outcomes.

Despite having access to rich data on learner behaviour, assessment performance, and demographic profiles, many operations teams lack a structured, repeatable framework for translating that data into timely, actionable decisions.

This project was commissioned to address that gap. Using the Open University Learning Analytics Dataset (OULAD) as a proxy for a real-world online education environment, the analysis aims to build a clear, evidence-based picture of programme health — identifying where learners are at risk, when disengagement typically occurs, and what operational interventions the data suggests.

---

## 2. Business Objectives

The primary objectives of this analysis are:

1. **Understand programme performance** — establish a baseline view of pass, fail, and withdrawal rates across modules, cohorts, and demographic groups.
2. **Identify engagement patterns** — determine how Virtual Learning Environment (VLE) activity correlates with learner outcomes, and whether engagement thresholds can be defined.
3. **Pinpoint critical intervention windows** — identify at what point in a programme learners typically begin to disengage or withdraw, enabling earlier and more targeted support.
4. **Assess predictive value of assessments** — evaluate how strongly early assessment scores signal final outcomes, and how much lead time this gives operations teams.
5. **Profile at-risk learners** — identify the combination of factors most associated with poor outcomes to support proactive programme management.
6. **Produce actionable recommendations** — translate findings into specific, operationally realistic recommendations for a Head of Learning Operations.

---

## 3. Stakeholders

| Stakeholder | Role | Interest in this Analysis |
|---|---|---|
| Head of Learning Operations | Primary client | Programme health overview, intervention strategy, resource allocation |
| Programme Managers | Secondary | Module-level performance, at-risk learner identification |
| Data & Reporting Team | Internal | Data pipeline, dashboard maintenance, ongoing monitoring |
| Enrolment & Admissions Team | Secondary | Demographic patterns, withdrawal risk at point of enrolment |
| Academic / Curriculum Team | Secondary | Module-level disengagement, assessment design effectiveness |

---

## 4. Scope

### In Scope
- Analysis of all 7 OULAD dataset files
- Student outcome analysis (pass, fail, distinction, withdrawn) across modules and demographic groups
- VLE engagement analysis — volume, timing, and activity type
- Assessment performance analysis — score trends, submission timing, correlation with outcomes
- Withdrawal timing analysis — identifying critical dropout windows
- At-risk learner profiling based on combined engagement and assessment signals
- SQL queries for operational reporting use cases
- Interactive Power BI dashboard for non-technical stakeholders
- Findings and recommendations report

### Out of Scope
- Real-time data processing or live dashboard integration
- Individual student identification (dataset is fully anonymised)
- Qualitative research — student surveys, interviews, or sentiment analysis
- Predictive machine learning modelling (may be explored as a future phase)
- Financial analysis — cost of withdrawal, revenue impact

---

## 5. Data Sources

**Primary Dataset:** Open University Learning Analytics Dataset (OULAD)  
**Source:** [https://analyse.kmi.open.ac.uk/open_dataset](https://analyse.kmi.open.ac.uk/open_dataset)  
**Licence:** Public domain — available for research and educational use  
**Coverage:** 22 module-presentation combinations · 7 unique modules · 4 presentations (2013J, 2013B, 2014J, 2014B) · 32,593 enrolment records · 28,785 unique students

> **Note on student count:** The dataset contains 32,593 rows in studentInfo.csv, as students who studied multiple modules appear more than once. The unique student count is 28,785. Both figures are used in the analysis depending on context — enrolment-level vs. student-level.

| File | Rows | Key Fields | Role in Analysis |
|---|---|---|---|
| `studentInfo.csv` | 32,593 | id_student, gender, region, highest_education, imd_band, age_band, num_of_prev_attempts, studied_credits, disability, final_result | Core outcomes and demographic analysis |
| `studentRegistration.csv` | 32,593 | id_student, code_module, date_registration, date_unregistration | Withdrawal timing and dropout analysis |
| `studentAssessment.csv` | 173,912 | id_assessment, id_student, date_submitted, is_banked, score | Assessment performance and submission behaviour |
| `assessments.csv` | 206 | id_assessment, code_module, assessment_type, date, weight | Assessment context — type, deadline, weighting |
| `studentVle.csv` | 10,655,280 | id_student, code_module, id_site, date, sum_click | Daily VLE engagement behaviour |
| `vle.csv` | 6,364 | id_site, code_module, activity_type | VLE activity classification |
| `courses.csv` | 22 | code_module, code_presentation, module_presentation_length | Programme length and module context |

### Date Convention
All dates in this dataset are expressed as **days relative to the module start date**, where day 0 is the first day of the module. Negative values indicate activity or registration occurring before the module officially began. This convention applies to studentVle, studentRegistration, studentAssessment, and assessments files.

---

## 6. Business Questions & Analysis Requirements

Each analysis question is mapped to a business need, a data source, and a deliverable.

### BQ1 — Programme Performance Overview
**Business need:** The Head of Learning Operations needs a baseline view of how programmes are performing before any deeper investigation.  
**Question:** What are the overall and module-level pass, fail, distinction, and withdrawal rates? Are there significant differences across demographic groups?  
**Data required:** `studentInfo.csv`, `courses.csv`  
**Deliverable:** Notebook 01 · Dashboard — Programme Overview page

### BQ2 — Learner Engagement Analysis
**Business need:** Engagement data is collected daily but rarely interrogated systematically. The team needs to know whether engagement volume correlates with outcomes — and if so, whether a minimum engagement threshold can be defined.  
**Question:** How does VLE interaction (total clicks, activity type, engagement timing) correlate with final outcomes? Is there a measurable engagement threshold below which failure or withdrawal becomes significantly more likely?  
**Data required:** `studentVle.csv`, `vle.csv`, `studentInfo.csv`  
**Deliverable:** Notebook 02 · Dashboard — Engagement Analysis page

### BQ3 — Dropout Timing & Withdrawal Patterns
**Business need:** Withdrawals are costly — to the learner, to the institution, and to programme health metrics. Understanding *when* they happen is the first step to preventing them.  
**Question:** At what point in a programme do students typically withdraw? Is there a consistent critical window? Do withdrawal patterns differ by module, demographic group, or prior attempt history?  
**Data required:** `studentRegistration.csv`, `studentInfo.csv`, `courses.csv`  
**Deliverable:** Notebook 03 · Dashboard — Withdrawal Patterns page

### BQ4 — Assessment Performance & Outcome Prediction
**Business need:** Assessment scores are the most direct signal of learner performance. The team needs to know how early in a programme assessment data becomes predictive — and how reliably.  
**Question:** How strongly do early assessment scores predict final results? What score thresholds are associated with pass vs. fail vs. withdrawal outcomes? Does submission timing (early, on-time, late) correlate with outcomes?  
**Data required:** `studentAssessment.csv`, `assessments.csv`, `studentInfo.csv`  
**Deliverable:** Notebook 04 · SQL — assessment_thresholds.sql

### BQ5 — At-Risk Learner Identification
**Business need:** No single factor tells the whole story. The team needs a combined view — which learners, based on the intersection of engagement, assessment, and demographic signals, are most at risk of a poor outcome?  
**Question:** Which combination of factors is most strongly associated with withdrawal or failure? Can at-risk learners be reliably identified early enough for intervention to be meaningful?  
**Data required:** All files  
**Deliverable:** Notebook 05 · Dashboard — At-Risk Overview page

---

## 7. Deliverables

| Deliverable | Format | Location |
|---|---|---|
| Data cleaning & preparation | Jupyter Notebook | `notebooks/01_student_overview.ipynb` |
| Engagement analysis | Jupyter Notebook | `notebooks/02_engagement_analysis.ipynb` |
| Dropout timing analysis | Jupyter Notebook | `notebooks/03_dropout_timing.ipynb` |
| Assessment performance analysis | Jupyter Notebook | `notebooks/04_assessment_performance.ipynb` |
| At-risk identification | Jupyter Notebook | `notebooks/05_at_risk_identification.ipynb` |
| Operational SQL queries | .sql files | `sql/` |
| Interactive dashboard | Power BI (.pbix) | `dashboard/` |
| Findings & recommendations report | Markdown | `reports/findings_and_recommendations.md` |
| Stakeholder summary | PDF | `presentation/project_summary.pdf` |

---

## 8. Success Criteria

The analysis will be considered successful if it delivers the following:

1. A clear, evidence-based answer to each of the 5 business questions above
2. At least one operationally actionable recommendation per business question
3. A Power BI dashboard that a non-technical stakeholder can interpret without guidance in under 2 minutes
4. SQL queries that could be handed to an operations team for ongoing reporting use
5. A findings report that is structured around decisions, not just observations

---

## 9. Assumptions

- The OULAD dataset is treated as representative of a real online education environment for the purposes of this analysis
- All student data is anonymised — no individual identification is possible or attempted
- "Engagement" is defined as total VLE clicks within a given time window unless otherwise specified
- A learner is considered "at risk" if their combined engagement and assessment signals fall below thresholds identified during analysis
- The analysis covers the full dataset without filtering to a specific module or cohort unless a specific question requires it
- Dates expressed as negative values (e.g. day -159) represent activity occurring before the module start date and are treated as valid data points

---

## 10. Known Data Quality Issues

These issues were identified during initial data scanning and are documented here for transparency. Each is handled explicitly in the relevant notebook.

| Issue | Detail | Impact | Handling |
|---|---|---|---|
| IMD band missing | 1,111 records (3.4%) have no deprivation index value | Limits completeness of socioeconomic analysis | Flagged in Notebook 01; excluded from IMD-specific analysis or treated as a separate "Unknown" category |
| Students with no assessment records | 5,416 students in studentInfo have no records in studentAssessment | Likely early withdrawals before any submission | Cross-referenced with registration dates in Notebook 03; treated as a meaningful signal in at-risk analysis |
| Withdrawn count mismatch | 9,155 withdrawn in studentInfo vs. 9,082 with unregistration date in studentRegistration | ~82 student records inconsistent across files | Flagged as a data quality note in Notebook 01; studentInfo final_result used as the authoritative outcome field |
| Exam dates missing | 11 exam assessments across modules AAA, BBB, CCC, DDD have no scheduled date | Cannot include these in deadline-based submission analysis | Excluded from submission timing analysis; included in score-based analysis only |
| VLE click outliers | Maximum recorded clicks in a single session: 6,977 | May skew engagement averages | Investigated during EDA; outliers noted and handled with median-based aggregation where appropriate |

---

## 11. Limitations

| Limitation | Impact | Mitigation |
|---|---|---|
| No qualitative data | Cannot explain *why* learners disengage — only *that* they do and *when* | Frame findings as signals requiring human follow-up, not definitive causes |
| VLE clicks are a proxy for engagement | Clicking is not the same as learning — a learner could click frequently without engaging meaningfully | Triangulate with assessment performance rather than relying on clicks alone |
| Dataset is from 2013–2014 | Learner behaviour on digital platforms has evolved significantly since then | Acknowledge as a limitation; analytical framework remains valid and transferable |
| No satisfaction or feedback data | Cannot measure learner experience quality | Scope explicitly excludes satisfaction metrics |
| Imbalanced outcome classes | Withdrawal rates vary significantly by module — some analyses may need to account for this | Note where class imbalance affects interpretation |
| Students appear in multiple modules | 32,593 enrolment records represent 28,785 unique students | Distinguish clearly between enrolment-level and student-level analysis throughout |

---

## 12. Timeline

| Phase | Activity | Status |
|---|---|---|
| Phase 1 | Business Requirements Document | ✅ Complete |
| Phase 2 | Data ingestion, cleaning & preparation | ✅ Complete |
| Phase 3 | Exploratory analysis (Notebooks 1–5) | ✅ Complete |
| Phase 4 | SQL query development | ⏳ Pending |
| Phase 5 | Power BI dashboard build | ⏳ Pending |
| Phase 6 | Findings & recommendations report | ⏳ Pending |
| Phase 7 | Stakeholder summary & presentation | ⏳ Pending |

---

*This document was prepared as part of a personal data analytics portfolio project. The business scenario is fictional but modelled on realistic operational requirements in online education and EdTech environments.*
