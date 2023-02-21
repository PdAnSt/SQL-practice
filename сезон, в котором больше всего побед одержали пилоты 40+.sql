-- СЕЗОН, В КОТОРОМ БОЛЬШЕ ВСЕГО ПОБЕД 
-- ОДЕРЖАЛИ ПИЛОТЫ СТАРШЕ 40 ЛЕТ

use formula 
select top(1)
    year(races.date) as season,
    count(drivers.driverId) as victories
    
from races 
    RIGHT JOIN results on races.raceId = results.raceId 
    RIGHT JOIN drivers on results.driverId = drivers.driverId

where results.positionOrder = 1
-- ВЫБЕРЕМ ПИЛОТОВ ВОЗРАСТА 40+
and drivers.dob BETWEEN '01.01.1169' 
-- НАЙДЕМ ГОД РОЖДЕНИЯ ДЛЯ СОРОКАЛЕТНЕГО ДЛЯ КАЖДОЙ
-- ИЗ ГОНОК, ПОСТАВИМ ЕГО КАК ВЕРХНЮЮ ГРАНИЦУ
and format(DATEADD(year, -40, races.date), 'dd/MM/yyyy')

GROUP by year(races.date)
ORDER by count(drivers.driverId) DESC