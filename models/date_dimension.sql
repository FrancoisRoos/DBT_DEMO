with cte as (
 select 
 to_timestamp(STARTED_AT) started_at,
 date(to_timestamp(STARTED_AT)) date_started_at,
 hour(to_timestamp(started_at)) hour_started_at,
 dayname(to_timestamp(started_at)) day_of_Week,

{{day_type('started_at')}} as day_type,

{{get_season('started_at')}} as season

  from {{ source('demo', 'bike') }}
)

select * 
  from cte