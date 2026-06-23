# Findings & Recommendations Report

**Project:** Programme Health Intelligence: A Learning Analytics Case Study  
**Dataset:** Open University Learning Analytics Dataset (OULAD)  
**Author:** Megha Sinha  
**Date:** June 2026  
**Version:** 1.0

---

## Executive Summary

This report presents findings from an end-to-end learning analytics project
analysing 32,593 student enrolment records across 7 modules of the Open
University Learning Analytics Dataset. The analysis examined VLE engagement,
assessment performance, withdrawal timing, and demographic patterns to build
a data-driven at-risk identification framework.

**The central finding:** More than half of all enrolments (52.8%) do not
result in a successful outcome. Withdrawal alone accounts for 31.2% of all
enrolments — nearly 1 in 3 students. The data consistently shows that
disengagement is detectable early, withdrawal is front-loaded in the first
10 weeks, and combined signals can identify at-risk students with remarkable
reliability.

---

## 1. Programme Performance Overview

### Finding 1 — Overall Non-Success Rate
52.8% of enrolments do not result in a successful outcome (Pass or
Distinction). Withdrawal (31.2%) is the single largest driver — nearly
1 in 3 students withdraws. This is not a marginal problem — it represents
a systemic challenge requiring structured operational response.

| Outcome | Count | % |
|---|---|---|
| Pass | 12,361 | 37.9% |
| Withdrawn | 10,156 | 31.2% |
| Fail | 7,052 | 21.6% |
| Distinction | 3,024 | 9.3% |

### Finding 2 — Module Variation in Withdrawal Rates
Withdrawal rates vary dramatically across modules — from 11.5% (GGG) to
44.5% (CCC). This variation confirms that module-specific factors are at
play, not just student-level characteristics.

| Module | Withdrawal Rate | Priority |
|---|---|---|
| CCC | 44.5% | Critical |
| DDD | 35.9% | High |
| FFF | 31.0% | High |
| BBB | 30.2% | High |
| EEE | 24.6% | Medium |
| AAA | 16.8% | Low |
| GGG | 11.5% | Benchmark |

### Finding 3 — GGG as Benchmark
GGG has the lowest withdrawal rate (11.5%) and strong pass numbers.
It should be studied as a benchmark — what does it do differently that
produces consistently better outcomes across all risk indicators?

---

## 2. Learner Engagement Analysis

### Finding 4 — Non-Engaged Students
Approximately 7,400 students (22.7% of enrolments) have no VLE activity
recorded at all — complete non-engagement from day one. These students
are at immediate risk and should be flagged at enrolment.

### Finding 5 — Engagement Directly Correlates with Outcomes
At the population level, a clear and consistent relationship exists between
VLE engagement and final outcomes:

| Outcome | Median Clicks |
|---|---|
| Distinction | 186 |
| Pass | 129 |
| Fail | 36 |
| Withdrawn | 24 |

### Finding 6 — Low Engagement is the Most Common Pattern
Over 6,000 students recorded fewer than 25 total VLE clicks — the single
largest group in the dataset, and the range most associated with failure
and withdrawal.

### Finding 7 — Clicks are a Probabilistic Signal, Not a Guarantee
VLE clicks are a probabilistic signal at the population level, not a
deterministic predictor for individuals. While engagement bands show a
consistent and strong correlation with outcomes across thousands of
students, individual exceptions exist. Click thresholds should be used
as early warning triggers for human follow-up, not as automatic outcome
predictors. The value is in identifying patterns across cohorts, not in
judging individual students.

### Finding 8 — Visualisation Note
Full range click distribution (0–4,153) was heavily right-skewed and
unreadable in a single chart. Charts were capped at 500 and 1,000 to
show meaningful patterns. This is a conscious analytical decision, not
data suppression.

### Finding 9 — The 75-Click Intervention Threshold
Students with fewer than 75 total VLE clicks have a success rate below
50% and a withdrawal rate above 25%. The 75-click mark represents a
clear, data-driven intervention threshold.

| Engagement Band | Students | Success Rate | Withdrawal Rate |
|---|---|---|---|
| Very Low (0–25) | 6,808 | 13.7% | 48.3% |
| Low (26–75) | 7,158 | 47.8% | 25.9% |
| Medium (76–150) | 5,565 | 67.7% | 14.5% |
| High (151–300) | 4,777 | 80.0% | 7.8% |
| Very High (300+) | 3,770 | 90.9% | 2.4% |

### Finding 10 — Engagement Bands Show Near-Linear Relationship
Success rate rises consistently from 13.7% (Very Low) to 90.9%
(Very High). Withdrawal rate falls from 48.3% to 2.4% across the same
bands. This consistency makes engagement level one of the most reliable
early indicators of outcome in the dataset.

### Finding 11 — Activity Type Matters, Not Just Total Clicks
Forum participation (forumng) shows the strongest differentiation between
outcome groups — Distinction students generate 2.4x more forum clicks
than Fail students. Quiz engagement also strongly differentiates (1.7x).
Resource downloads show almost no difference (1.1x) — accessing materials
alone is insufficient without active engagement.

### Finding 12 — Temporal Analysis Note
Weekly engagement patterns and pre-withdrawal click behaviour did not
yield statistically distinguishable signals at the aggregate level —
individual longitudinal tracking is recommended as a future analysis.
Dropout timing is more reliably explored through registration data
(see Section 3).

---

## 3. Dropout Timing & Withdrawal Patterns

### Finding 13 — Withdrawals are Heavily Front-Loaded
62.8% of all withdrawals occur before the module reaches its halfway
point. 26.3% withdraw before the module even starts.

| Stage | Count | % of All Withdrawals |
|---|---|---|
| Pre-module (before day 0) | 2,643 | 26.3% |
| Very Early (0–25%) | 3,664 | 36.5% |
| Early (25–50%) | 1,647 | 16.4% |
| Mid (50–75%) | 1,441 | 14.4% |
| Late (75–100%) | 637 | 6.4% |
| Post-module | 1 | 0.0% |

The median withdrawal day is day 66 — approximately 9–10 weeks into
the module. The first 10 weeks are the single most critical intervention
window in the entire programme lifecycle.

### Finding 14 — Module Withdrawal Patterns Require Different Strategies
BBB (55.6%), CCC (52.6%), and EEE (52.4%) lose the majority of their
withdrawn students in the first quarter — pointing to onboarding and
expectation-setting failures. CCC is uniquely problematic — it has both
the highest very early withdrawal rate and the highest overall withdrawal
rate, indicating sustained disengagement problems throughout the module.
GGG's low very early rate (31.7%) combined with its low overall
withdrawal rate makes it the strongest benchmark module.

### Finding 15 — Repeat Attempt Students Withdraw Later but Still Struggle
First-time students have the highest very early withdrawal rate (50.2%)
and withdraw earliest (median day 65). Students with two prior attempts
show a notably different pattern — lower very early withdrawal (39.3%)
and later median withdrawal day (100). These persistent re-enrollers
represent a distinct at-risk group requiring targeted support focused on
overcoming specific completion barriers. Groups with 4+ prior attempts
are too small for reliable conclusions.

### Finding 16 — 50.2% of Withdrawals are Pre-Assessment Dropouts
Half of all withdrawn students never submitted a single assessment —
indicating a commitment and onboarding failure rather than a performance
failure. BBB is the most extreme case with 94.3% of its withdrawn
students leaving without any academic submission. EEE follows at 84.8%.
AAA is notably different — only 26.4% pre-assessment dropout, suggesting
AAA withdrawals are performance-driven rather than engagement-driven.

### Two Distinct Withdrawal Types Identified

**Type 1 — Commitment/Onboarding Failure**
Student registers but disengages before meaningful academic participation.
Characterised by pre-module or very early withdrawal, no assessment
submission. Most prevalent in BBB and EEE.
*Intervention: Pre-module engagement, clear expectation setting, early outreach.*

**Type 2 — Performance/Sustained Struggle**
Student engages academically but withdraws after attempting assessments.
Characterised by later withdrawal timing, at least one assessment submitted.
Most prevalent in AAA and CCC.
*Intervention: Academic support, assessment feedback, targeted coaching.*

---

## 4. Assessment Performance & Outcome Prediction

### Finding 17 — Submission Timing Baseline
70% of assessment submissions are on time or early. Late submissions
(0–7 days after deadline) account for 25% and very late for 3.3%.

### Finding 18 — Withdrawn Students Score Higher than Fail Students
Withdrawn students have a higher median assessment score (70.0) than
fail students (66.0). This confirms that withdrawal is primarily a
commitment and engagement problem rather than a performance failure.
Students who withdraw often do so while still achieving reasonable
scores — they disengage before poor performance forces them out.

### Finding 19 — Assessment Score Threshold Identified at 55 Marks
Students scoring below 55 on assessments have a fail/withdrawal rate
above 47.5% — more likely to fail or withdraw than succeed. Below 40
marks the rate rises to 63.5% — a critical risk zone.

| Score Band | Success Rate | Fail/Withdrawn Rate |
|---|---|---|
| Very Low (0–40) | 36.5% | 63.5% |
| Low (41–55) | 52.5% | 47.5% |
| Medium (56–70) | 68.2% | 31.8% |
| High (71–85) | 81.1% | 18.9% |
| Very High (86–100) | 87.8% | 12.2% |

### Finding 20 — Late Submission is an Independent Risk Signal
Late submission predicts poor outcomes independently of score. Students
submitting 0–7 days late score similarly to on-time students (median 80
vs 77) but have a significantly higher fail/withdrawal rate (30.6% vs
23.3%). Very late submission (>7 days) shows both behavioural and
performance deterioration — 44.9% fail/withdraw rate and median score
dropping to 65. Submission timing should be monitored as a standalone
early warning signal alongside score and engagement data.

### Finding 21 — Assessment Data is Predictive from Week 1
The gap between success rates of students scoring above and below 55
marks is wide from the very first assessment week — a 33 percentage
point gap exists from week 1. By week 4 this gap widens to 59 points,
with below-threshold students having only a 10.5% success rate.
Assessment data does not need to accumulate over multiple weeks before
becoming actionable. A single below-threshold score in week 1 or 2,
particularly when combined with low VLE engagement, should be sufficient
to trigger an at-risk flag.

---

## 5. At-Risk Identification Framework

### Finding 22 — Framework Validates Strongly Against Outcomes
The combined at-risk framework produces a clear, consistent pattern:

| Risk Category | Students | Success Rate | Fail/Withdrawn Rate |
|---|---|---|---|
| Low Risk | 8,825 | 83.6% | 16.4% |
| Medium Risk | 9,312 | 59.2% | 40.8% |
| High Risk | 6,351 | 37.7% | 62.3% |
| Critical Risk | 8,105 | 1.3% | 98.7% |

The 82 percentage point gap between Low and Critical Risk confirms the
framework is operationally reliable. The High Risk category — based on
actual score and engagement data — shows a 62.3% fail/withdrawal rate,
making it the most actionable group for targeted intervention.

### Risk Signal Thresholds

| Signal | Threshold | Notebook |
|---|---|---|
| VLE Engagement | < 75 total clicks | Notebook 02 |
| Assessment Score | < 55 median score | Notebook 04 |
| Submission Timing | > 30% late submissions | Notebook 04 |
| Missing Assessment Data | No submissions recorded | Notebook 03 |

---

## 6. Operational Recommendations

### Immediate Actions

1. **Flag students with no VLE activity by end of week 2** — 7,400
   students show zero engagement. These are at immediate risk and
   should receive outreach before they disengage completely.

2. **Act on first assessment scores** — assessment data is predictive
   from week 1. A score below 55 in the first assessment should trigger
   an academic support referral immediately, not after multiple
   assessments confirm the pattern.

3. **Treat scores below 40 as critical** — 63.5% fail/withdrawal rate
   warrants urgent, not routine, intervention.

4. **Monitor submission timing independently of score** — a student
   submitting late with a decent score is still at elevated risk.
   Two late submissions should trigger a check-in call.

5. **Launch pre-module engagement campaigns** — 26.3% of withdrawals
   happen before day 0. Contacting registered students before the
   module starts with clear expectations, resources, and a welcome
   message could significantly reduce pre-module dropout.

### Module-Specific Priorities

| Module | Key Issue | Recommended Intervention |
|---|---|---|
| CCC | Highest overall withdrawal + sustained dropout | Both onboarding AND sustained academic support |
| BBB | 94.3% pre-assessment dropout | Pre-module engagement campaign, week 1 outreach |
| DDD | High withdrawal + high risk concentration | Early academic support programme |
| FFF | High withdrawal + largest cohort | Scalable intervention — automated early warning system |
| EEE | 84.8% pre-assessment dropout | Pre-module expectation setting |
| GGG | Lowest risk across all metrics | Study as benchmark — replicate practices in other modules |

### Intervention Timing Framework

| Trigger | Timing | Action |
|---|---|---|
| No VLE activity | By end of week 2 | Outreach email |
| Score below 55 | After first assessment | Academic support referral |
| Score below 40 | After first assessment | Urgent contact + escalation |
| Late submission pattern | After second late submission | Check-in call |
| No assessment submitted | By assessment deadline | Urgent contact |
| Pre-module withdrawal risk | At enrolment | Pre-module engagement campaign |

---

## 7. Limitations & Recommended Future Analysis

### Limitations

| Limitation | Impact |
|---|---|
| No qualitative data | Cannot explain why learners disengage — only that they do and when |
| VLE clicks are a proxy | Clicking is not the same as learning |
| Dataset from 2013–2014 | Learner behaviour has evolved since then |
| No satisfaction data | Cannot measure learner experience quality |
| Sampled VLE data | studentVle.csv sampled at 10% — findings directionally reliable but not exact |

### Recommended Future Analysis

1. **Individual longitudinal engagement tracking** — track each
   student's weekly click trajectory rather than total clicks to
   identify the exact week engagement drops to zero
2. **Machine learning classification** — use the signals identified
   here as features in a predictive model for outcome classification
3. **Investigate GGG as benchmark** — qualitative and quantitative
   analysis of what GGG does differently
4. **Real-time dashboard** — implement the at-risk framework as a
   live Power BI dashboard updated weekly

---

*This report was produced as part of a personal data analytics portfolio
project. The business scenario is fictional but modelled on realistic
operational requirements in online education and EdTech environments.*
