-- At-Risk Students by Assessment Threshold (sample of 20)
-- Project: Programme Health Intelligence
-- Author: Megha Sinha
-- Date: June 2026


SELECT
    si.id_student,
    si.code_module,
    si.code_presentation,
    si.final_result,
    ROUND(AVG(sa.score), 1)          AS median_score,
    COUNT(sa.id_assessment)          AS assessments_submitted,
    CASE
        WHEN AVG(sa.score) < 40 THEN 'Critical Risk'
        WHEN AVG(sa.score) < 55 THEN 'High Risk'
        WHEN AVG(sa.score) < 70 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END                              AS score_risk_flag
FROM student_info si
LEFT JOIN student_assessment sa
    ON  si.id_student        = sa.id_student
JOIN assessments a
    ON  sa.id_assessment     = a.id_assessment
    AND si.code_module       = a.code_module
WHERE si.final_result IN ('Fail', 'Withdrawn')
GROUP BY
    si.id_student,
    si.code_module,
    si.code_presentation,
    si.final_result
HAVING AVG(sa.score) < 55
ORDER BY
    median_score ASC
LIMIT 20
