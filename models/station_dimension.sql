with bike as (
    select distinct start_station_name, 
           start_station_id, 
           start_lng start_lon,
           start_lat
      from {{ source('demo', 'bike') }} limit 10
)

select * from bike