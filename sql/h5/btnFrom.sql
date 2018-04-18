select dt,
       (case
            when PARAMETERS['from'] = '1'
                 and PARAMETERS['btnFrom'] = '0' then 'shoutu'
            when PARAMETERS['from'] = '1'
                 and PARAMETERS['btnFrom'] ='3' then 'huanxing'
            else '2'
        end) as btn,
       count(1) as times,
       count(distinct udid) as dau
from matrix_log.dws_bobo_h5_log
where dt >= '20180221'
    and dt <= '20180221'
    and eventid = 'red_in_h5_click'
    and ((PARAMETERS['from'] = '1'
          and PARAMETERS['btnFrom'] in('0',
                                       '3'))
         or (PARAMETERS['from'] = '2'
             and PARAMETERS['btnFrom'] = '2'))
group by dt,(case
                 when PARAMETERS['from'] = '1'
                      and PARAMETERS['btnFrom'] = '0' then 'shoutu'
                 when PARAMETERS['from'] = '1'
                      and PARAMETERS['btnFrom'] ='3' then 'huanxing'
                 else '2'
             end)