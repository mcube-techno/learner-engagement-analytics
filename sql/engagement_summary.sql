-- VLE Engagement Summary by Module
-- Project: Programme Health Intelligence
-- Author: Megha Sinha
-- Date: June 2026


SELECT
    si.code_module,
    si.code_presentation,
    COUNT(DISTINCT sv.id_student)          AS active_students,
    SUM(sv.sum_click)                      AS total_clicks,
    ROUND(AVG(sv.sum_click), 1)            AS avg_clicks_per_session,
    ROUND(SUM(sv.sum_click) * 1.0 /
          COUNT(DISTINCT sv.id_student), 1) AS avg_clicks_per_student
FROM student_vle sv
JOIN student_info si
    ON  sv.id_student        = si.id_student
    AND sv.code_module       = si.code_module
    AND sv.code_presentation = si.code_presentation
GROUP BY
    si.code_module,
    si.code_presentation
ORDER BY
    avg_clicks_per_student DESC
