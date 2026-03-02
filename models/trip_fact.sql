with trips as (
    select ride_id,
           date(to_timestamp(started_at)) trip_date,
           start_station_id,
           end_Station_id,
           member_casual,
           timestampdiff(second, to_timestamp(started_at), to_timestamp(ended_at)) trip_duration_seconds
      from {{ ref('stage_bike') }} limit 10
)

select * from trips