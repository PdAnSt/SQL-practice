-- ПОБЕДИТЕЛИ КВАЛИФИКАЦИИ В МОНАКО
use formula
select 
-- ВЫВЕДЕМ КОЛИЧЕСТВО ПОБЕД И ФАМИЛИИ
    COUNT(qualifying.position) as win_times,
    drivers.surname 
from qualifying
inner join races on qualifying.raceId = races.raceId
inner join drivers on qualifying.driverId = drivers.driverId

-- УСЛОВИЯ ПО МЕСТУ И СЕЗОНУ
where races.name like 'monaco%' 
and qualifying.position = 1
GROUP BY drivers.surname
-- ВЫВЕДЕМ ФАМИЛИИ ПО КОЛИЧЕСТВУ ПОБЕД
ORDER BY count(qualifying.position) DESC
