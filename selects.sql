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

-- Who are the 10 most valuable players by market_value_eur?
select *
from public.squads_and_players
where market_value_eur is not null
order by market_value_eur desc
limit 10;

--Who are the 5 tallest players?
select * 
from public.squads_and_players
order by height_cm desc
limit 5

-- Who are the top 10 goal scorers in player_stats?
select * 
from public.squads_and_players
order by goals desc
limit 10

-- Which players have received a red card?

select *
from player_stats
where red_cards >= 1

-- How many matches were played on each date?

select date, count(*) as match_count
from matches_detailed
group by date
order by match_count desc;

-- List all Group A teams with their managers.
select team_id, team_name, group_letter, manager_name
from public.teams
where group_letter = 'A'
order by team_name;


-- Which match had the highest combined xG?
select match_id, home_xg, away_xg, (home_xg + away_xg) as combined_xg
from public.matches_detailed
where home_xg is not null and away_xg is not null
order by combined_xg desc
limit 1;

-- How many distinct club teams are represented in squads_and_players?

select count(distinct team_id) as team_count
from public.squads_and_players;