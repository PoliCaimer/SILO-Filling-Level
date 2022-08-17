SELECT
BEZ1.loctype, 
--BEZ1.zajete, 
--Z1.wolne, 
ROUND
((BEZ1.zajete/(BEZ1.zajete + Z1.wolne)*100))  as "wypelnienie %"

FROM

(
    SELECT 
    loctype, 
    COUNT(loctype) as zajete
    
    FROM ASTRO_VIEW_CNT_W08L30

    WHERE
    mha = '26R1'
    and locstat != '1'

    GROUP BY
    loctype
) BEZ1

LEFT JOIN

(
    SELECT 
    loctype, 
    COUNT(loctype) as wolne

    FROM 
    ASTRO_VIEW_CNT_W08L30

    WHERE
    mha = '26R1'
    and locstat = '1'

    GROUP BY
    loctype
) Z1

ON BEZ1.loctype = Z1.loctype

ORDER BY 
loctype

