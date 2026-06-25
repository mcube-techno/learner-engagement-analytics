-- Withdrawal Rates by Demographic Group (top 20)
-- Project: Programme Health Intelligence
-- Author: Megha Sinha
-- Date: June 2026


SELECT
    si.age_band,
    si.gender,
    si.imd_band,
    COUNT(*)                                    AS total_students,
    SUM(CASE WHEN si.final_result = 'Withdrawn'
             THEN 1 ELSE 0 END)                 AS withdrawn_count,
    ROUND(
        SUM(CASE WHEN si.final_result = 'Withdrawn'
                 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 1)                          AS withdrawal_rate_pct,
    ROUND(
        SUM(CASE WHEN si.final_result IN ('Pass', 'Distinction')
                 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 1)                          AS success_rate_pct
FROM student_info si
GROUP BY
    si.age_band,
    si.gender,
    si.imd_band
HAVING COUNT(*) >= 50
ORDER BY
    withdrawal_rate_pct DESC
LIMIT 20
