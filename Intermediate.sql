-- Produce a readable match list: date, stage name, stadium, 
-- home team, away team and score (join teams twice).

SELECT
    M.match_id,
    M.date,
    TS.stage_name,
    V.stadium_name,
    HT.team_name AS home_team,
    AW.team_name AS away_team,
    M.home_score || ' - ' || M.away_score AS score
FROM matches M
JOIN tournament_stages TS ON M.stage_id     = TS.stage_id
JOIN venues V             ON M.venue_id     = V.venue_id
JOIN teams HT             ON M.home_team_id = HT.team_id
JOIN teams AW             ON M.away_team_id = AW.team_id
ORDER BY M.date, M.kickoff_time_utc;