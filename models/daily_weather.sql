with daily_weather as (
select date(time) day_, weather, clouds, huidity humidity, pressure, temp
  from {{ source('demo', 'weather') }} 
),

daily_weather_agg as (
select day_, weather, 
       round(avg(temp), 2) avg_temp, 
       round(avg(humidity), 2) avg_humidity, 
       round(avg(pressure), 2) avg_pressure, 
       round(avg(clouds), 2) avg_clouds
  from daily_weather
group by day_, weather
qualify row_number() over(partition by day_ order by count(*) desc) = 1
)


select * from daily_weather_agg