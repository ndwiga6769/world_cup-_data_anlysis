-- How many matches were played on each stage

SELECT T.stage_name,count(M.stage_id)
	FROM public.matches M
	join tournament_stages T
	on T.stage_id = M.stage_id
	group by T.stage_name

--List the stages that are knockout stages.

select * from tournament_stages
where is_knockout is true

--Show the 5 referees with the highest avg_cards_per_game.

select * from referees
order by avg_cards_per_game desc
limit 5


-- Which matches went to a penalty shootout (penalty scores not null) name the teams that played

select M.match_id,
		M.stage_id,
		M.home_team_id,
		M.away_team_id,
		a.team_name,
		h.team_name,
from matches M
join teams a ON T.team_id = M.home_team_id 
JOIN teams h ON T.team_id = M.away_team_id
where home_penalty_score is NOT NULL

SELECT m.match_id,
       m.stage_id,
       h.team_name AS home_team,
       a.team_name AS away_team,
       m.home_score,
       m.away_score,
       m.home_penalty_score,
       m.away_penalty_score
FROM public.matches m
JOIN public.teams h ON h.team_id = m.home_team_id
JOIN public.teams a ON a.team_id = m.away_team_id
WHERE m.home_penalty_score IS NOT NULL
  AND m.away_penalty_score IS NOT NULL
ORDER BY m.match_id;

--What is the total number of goals scored in the tournament?
select sum(home_score) + sum(away_score) as total_score from matches

--List matches with 5 or more total goals.
SELECT match_id,
       home_score + away_score AS total_goals
FROM matches
WHERE home_score + away_score >= 5;

--How many players are there in each position?
select position,count (*) 
from player_stats
group by 1

--How many players are there in each position?
select position,count (*) 
from player_stats
group by 1