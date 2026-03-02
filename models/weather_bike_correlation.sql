with trips as (
    select *
      from {{ ref('trip_fact') }} t left join {{ ref('daily_weather') }} w on t.trip_date = w.day_
      
)

select * 
  from trips