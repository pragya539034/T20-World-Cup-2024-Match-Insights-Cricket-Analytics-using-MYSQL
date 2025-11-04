-- 1. Display all match details
SELECT * FROM T20WC;


-- 2. List all unique venues
SELECT DISTINCT VENUE AS `T20 WC 2024 VENUES` FROM T20WC;


-- 3. Count total number of matches
SELECT COUNT(`Match No.`) AS total_matches FROM T20WC;


-- 4. Find total matches won by each team
SELECT Winners , Count(*) AS matches_won FROM T20WC 
GROUP BY Winners
ORDER BY matches_won DESC;


-- 5.Find matches where toss winner also won the match
SELECT  * FROM T20WC
Where `Toss Winning`=Winners;


-- 6. List top 5 highest first innings scores
SELECT  `1st Team`,`First Innings Score` FROM T20WC
ORDER BY  `First Innings Score` DESC
LIMIT 5;


-- 7. Count matches by stage 
SELECT Stage ,COUNT(*)  AS Matches_played From T20WC
Group BY Stage;


-- 8. Find average winning margin
SELECT AVG(`Winning Margin`) AS `Average of Winning margin` FROM T20WC;


-- 9. List all matches with "Player of the match"
SELECT `Match No.`, Winners,`Player Of The Match` FROM T20WC;


-- 10. Show top scorers and their highest scores
SELECT `Top Scorer`,`Highest Score` FROM T20WC
ORDER BY `Highest Score` DESC
LIMIT 5;

 
 -- 11.Find the team with the most "player of the match" awards
 SELECT Winners ,COUNT(`Player Of The Match`) AS Total_Awards FROM T20WC
 GROUP BY Winners
 Order BY Total_Awards DESC
 LIMIT 1;
 
 
 -- 12. Compare matches won by batting first vs fielding first
 SELECT `Toss Decision`,COUNT(*) AS Matches_won FROM T20WC
 WHERE `Winners`=`Toss Winning`
 GROUP BY `Toss Decision`;
 
 
 -- 13.Find the venue with the highest average first innings score
 SELECT Venue, AVG(`First Innings Score`) AS Venue_with_avg_1st_innings from T20WC
 Group by Venue
 ORDER BY Venue_with_avg_1st_innings DESC
 LIMIT 1;
 
 
 -- 14 .Find all matches winner by teams batting in 2nd innings
 SELECT  *  FROM T20WC
 WHERE `Toss Decision`='Batting';
 

-- 15. Identify top 5 matches with largest winning margin
 SELECT * FROM t20wc 
 ORDER BY `Winning Margin` DESC
 LIMIT 5;
 
 
 -- 16. Find the most frequent "player of the match"
 SELECT `Player Of The Match`,COUNT(*) AS Award FROM T20WC
 GROUP BY `Player Of The Match`
 ORDER BY  Award DESC
 LIMIT 1;
 
 
 -- 17. calculate total matches played by each team
 SELECT `1st Team`, COUNT(*) FROM T20WC
 GROUP BY `1st Team`
 UNION ALL
SELECT `2nd Team`, COUNT(*) FROM T20WC
 GROUP BY `2nd Team`;
 
 
 -- 18. Show average winning margin by stage
 SELECT Stage, AVG(`Winning Margin`) AS Avg_margin from T20WC
 GROUP BY Stage;
 
 
 -- 19.Find top scorers who appeared more than one
 SELECT `Top Scorer`, count(*) AS Appered_morethan_one FROM T20WC
 GROUP BY `Top Scorer`
 HAVING count(*)>1
 ORDER BY Appered_morethan_one DESC;
 
 
 -- 20. Find correlation between toss winners and match winners(percentage)
 SELECT 
    (COUNT(CASE WHEN `Toss Winning` = Winners THEN 1 END) * 100.0 / COUNT(*)) AS Toss_Win_Match_Win_Percentage
FROM T20WC;
