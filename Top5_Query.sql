--merge tables
SELECT c.Category, c.ContentType, r.ReactionType, rt.Sentiment, rt.Score, r.Datetime
FROM Reactions_Cleaned as r
    RIGHT JOIN Content_Cleaned as c
        ON r.ContentID = c.ContentID
    RIGHT JOIN ReactionTypes_Clean as rt
        ON r.ReactionType = rt.ReactionType;

--top 5 categories
SELECT Category, SUM(Score) as TotalScore
FROM (SELECT c.Category, rt.Score
    FROM Reactions_Cleaned as r
        RIGHT JOIN Content_Cleaned as c
            ON r.ContentID = c.ContentID
        RIGHT JOIN ReactionTypes_Clean as rt
            ON r.ReactionType = rt.ReactionType)
GROUP BY Category 
ORDER BY TotalScore DESC 
LIMIT 5