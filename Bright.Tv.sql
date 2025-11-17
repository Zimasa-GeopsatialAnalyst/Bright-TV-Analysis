select
    Channel2,
    RecordDate2,
    Duration2,
    Gender,
    Race,
    Age,
    Province,
    Channel2,
    age
from
    bright_tv.tv.viewership as A full
    outer join bright_tv.tv.userprofile as B ON A.USERID = B.USERID,
    ------Duration
    CASE
        when duration2 between 00 :01:00
        AND 00 :29:00 then < 30 minutes
        when duration2 = 00 :30:00 then > 30 minutes
        when duration2 between 00 :31:59 then < 1 Hour
        else > 1 Hour
    End as duration Interval
from
    bright_tv.tv.userprofile;
-----Extract month from record date
select
    To_Date (RecordDate2, 'DD/MM/YYYY') as 'Record_Date'
from
    bright_tv.tv.viewership;
---------updated code
SELECT
    COALESCE(A.Channel2, 'Not defined') AS Channel2,
    A.RecordDate2,
    A.Duration2,
    COALESCE(B.Gender, 'Not defined') AS Gender,
    COALESCE(B.Race, 'White') AS Race,
    B.Age AS Age,
    COALESCE(B.Province, 'Gauteng') AS Province,
    CASE
        WHEN A.Duration2 BETWEEN '00:01:00'
        AND '00:29:59' THEN '< 30 minutes'
        WHEN A.Duration2 = '00:30:00' THEN '= 30 minutes'
        WHEN A.Duration2 BETWEEN '00:30:01'
        AND '00:59:59' THEN '< 1 hour'
        ELSE '> 1 hour'
    END AS Duration_Interval
FROM
    bright_tv.tv.viewership AS A FULL
    OUTER JOIN bright_tv.tv.userprofile AS B ON A.USERID = B.USERID;
select
    *,
FROM
    bright_tv.tv.viewership;
Select
    min(recorddate2)
FROM
    bright_tv.tv.viewership;