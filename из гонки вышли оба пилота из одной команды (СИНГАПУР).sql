-- ГОНКИ В СИНГАПУРЕ, 
-- КОГДА ИЗ ГОНКИ ВЫШЛИ ОБА ПИЛОТА ИЗ ОДНОЙ КОМАНДЫ

-- ВРЕМЕННАЯ ТАБЛИЦА,
-- СКОЛЬКО ПИЛОТОВ ВЫШЛО ИЗ ГОНКИ
-- ДЛЯ ВСЕХ КОМАНД В СИНГАПУРЕ
with a as (SELECT 
 r.constructorId, 
 count(r.driverId) as num_of_dr,
 r.raceId
from results r
inner join races rr on r.raceId = rr.raceId
inner join status s on r.statusId = s.statusId
-- УСЛОВИЯ: СИНГАПУР, НУЖНЫЙ НОМЕР СТАТУСА
where rr.name like 'singa%' 
and r.statusId between 2 and 4
-- СОБЕРЕМ ПО КОМАНДАМ И ЗАЕЗДАМ
group by r.constructorId, r.raceId) 

-- НАЙДЕМ КОМАНДЫ, ГДЕ ВЫШЛО БОЛЕЕ 1 ПИЛОТА
select * from a where num_of_dr > 1
