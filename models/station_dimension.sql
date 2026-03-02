with bike as (
    select distinct start_station_name, 
           start_station_id, 
           start_lng start_lon,
           start_lat
      from {{ ref('stage_bike') }}
)

select * from bike