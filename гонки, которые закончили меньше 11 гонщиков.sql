-- ПОЛУЧИТЬ ВСЕ RACE_ID ГОНОК,
-- КОТОРЫЕ ЗАКОНЧИЛИ <= 10 ГОНЩИКОВ

--ВРЕМЕННАЯ ТАБЛИЦА
with results_of_races as (
select distinct
-- ПОЛУЧАЕМ НОМЕРА ГОНОК И КОЛИЧЕСТВО 
-- УЧАСТНИКОВ, ЗАВЕРШИВШИХ ГОНКУ
r.raceId, count(r.driverID) as number_of_drivers
from results r
-- ДОБАВЛЯЕМ ТАБЛИЦУ СО ЗНАЧЕНИЕМ СТАТУСОВ 
inner join status s on r.statusId = s.statusId
-- ВЫВОДИМ ТОЛЬКО ЗАВЕРШИВШИХ ГОНКУ
where s.status like 'finished'
GROUP by r.raceId
)

--ИЩЕМ ГОНКИ, ГДЕ МЕНЕЕ 11 ГОНЩИКОВ
select * from results_of_races ror
where ror.number_of_drivers <= 10 

