-- ПОБЕДИТЕЛИ ГОНОК С ПОСЛЕДНЕГО МЕСТА В КВАЛИФИКАЦИИ
use formula
select distinct 
a.driverID
-- ПОДСЕЛЕКТ ДЛЯ ПОИСКА ГОНЩИКОВ 
--С ПОСЛЕДНИМ МЕСТОМ В КВАЛИФИКАЦИИ
from (
    select q.driverID 
    from qualifying q
    where q.position > 10) a  
inner join results r on a.driverId = r.driverId
-- УСЛОВИЕ ПОБЕДЫ
where r.positionOrder = 1