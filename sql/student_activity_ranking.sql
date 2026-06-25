-- Student Activity Ranking by Module (least engaged, sample of 20)
-- Project: Programme Health Intelligence
-- Author: Megha Sinha
-- Date: June 2026


SELECT
    id_student,
    code_module,
    code_presentation,
    total_clicks,
    RANK() OVER (
        PARTITION BY code_module, code_presentation
        ORDER BY total_clicks ASC
    ) AS engagement_rank,
    RANK() OVER (
        PARTITION BY code_module, code_presentation
        ORDER BY total_clicks DESC
    ) AS engagement_rank_desc,
    ROUND(total_clicks * 100.0 / SUM(total_clicks) OVER (
        PARTITION BY code_module, code_presentation
    ), 2) AS pct_of_module_clicks
FROM (
    SELECT
        id_student,
        code_module,
        code_presentation,
        SUM(sum_click) AS total_clicks
    FROM student_vle
    GROUP BY
        id_student,
        code_module,
        code_presentation
) ranked_students
ORDER BY
    code_module,
    code_presentation,
    engagement_rank ASC
LIMIT 20
