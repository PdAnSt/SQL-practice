-- ПИЛОТ С МАКСИМАЛЬНЫМ КОЛИЧЕСТВОМ ГОНОК,
-- КОТОРЫЙ НИКОГДА НЕ ЗАНИМАЛ ПРИЗОВОЕ МЕСТО 
USE formula
-- ВЫВЕДЕМ ПИЛОТА С МАКС. КОЛ-ВОМ ГОНОК
select TOP (1)
    outher.driverId,
    -- КОЛИЧЕСТВО ГОНОК
    COUNT(outher.driverId) as races_number,
    d.surname

from results as outher inner JOIN drivers d on d.driverId = outher.driverId
-- ОПЕРАТОР ОТСУТСТВИЯ ДЛЯ ИСКЛЮЧЕНИЯ ПОБЕДИТЕЛЕЙ
WHERE not EXISTS (SELECT positionOrder
    from results
    where positionOrder<3 and outher.driverId = driverId)

group by outher.driverId, d.surname
ORDER by races_number DESC