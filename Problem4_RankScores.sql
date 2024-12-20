# Write your MySQL query statement below
WITH RankedScores AS (
    SELECT *, DENSE_RANK() OVER (ORDER BY Score DESC) AS ScoreRank FROM Scores
)

SELECT score, ScoreRank as 'rank' FROM RankedScores