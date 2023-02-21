-- ПОБЕДИТЕЛИ КВАЛИФИКАЦИИ В МОНАКО
use formula
-- ВЫБИРАЕМ ГОНЩИКОВ
select
driverRef
from drivers d
-- ОПЕРАТОР СУЩЕСТВОВАНИЯ ДЛЯ ВЫБОРА ПОБЕДИТЕЛЯ И СЕЗОНА
where exists (
    select * from qualifying q
    inner join races r on q.raceId = r.raceId
    where d.driverId = q.driverId
    -- ВЫБИРАЕМ ПОБЕДИТЕЛЯ
    and q.position = 1
    -- ВЫБИРАЕМ СЕЗОН В МОНАКО С ПОМОЩЬЮ РЕГ. ВЫРАЖЕНИЯ
    and r.name like 'monaco%'
)
