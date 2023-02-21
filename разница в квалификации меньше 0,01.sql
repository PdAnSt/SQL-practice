-- ГОНКИ, В КОТОРЫХ РАЗНИЦА В КВАЛИФИКАЦИИ 
-- МЕНЬШЕ 0,01

with timecount as (
--ВРЕМЕННАЯ ТАБЛИЦА
select 
-- ДОПОЛНИМ ВРЕМЯ ДЛЯ ВЫЧИСЛЕНИЯ
    CONCAT('01.01.1969 00:0', q3) as fixed_result,
    raceId,
    q.position
    from qualifying q
    -- 1 И 2 МЕСТО
    where q.position <3
    -- ИСКЛЮЧАЕМ ПУСТЫЕ ЗНАЧЕНИЯ
    and q3 != 'NULL'
    and q3 != ' ')
--ОСНОВНОЙ ЗАПРОС
select
    place1.raceId,
    place1.fixed_result as first_place,
    place2.fixed_result as second_place,
    -- СЧИТАЕМ РАЗНИЦУ ВО ВРЕМЕНИ
    datediff(ms, place1.fixed_result, 
    place2.fixed_result) as difference
-- ПОДСЕЛЕКТ ДЛЯ 1 МЕСТА
from (
    select
    *
    from timecount
    where timecount.position = 1
    ) as place1
-- ПОДСЕЛЕКТ ДЛЯ 2 МЕСТА
inner join (
    select
    * 
    from timecount
    where timecount.position =2
) as place2 on place1.raceId = place2.[raceId]
-- РАЗНИЦА МЕНЬШЕ 0.01 СЕКУНД 
where datediff(ms, place1.fixed_result, 
place2.fixed_result) <100
