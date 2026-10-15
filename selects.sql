-- How many matches were played on each stage

SELECT T.stage_name,count(M.stage_id)
	FROM public.matches M
	join tournament_stages T
	on T.stage_id = M.stage_id
	group by T.stage_name

--List the stages that are knockout stages.

select * from tournament_stages
where is_knockout is true