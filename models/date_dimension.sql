with cte as (
 select 
 to_timestamp(STARTED_AT) started_at,
 date(to_timestamp(STARTED_AT)) date_started_at,
 hour(to_timestamp(started_at)) hour_started_at,
 dayname(to_timestamp(started_at)) day_of_Week,

 case when dayname(to_timestamp(started_at)) IN ('Sat', 'Sun') 
      then 'Weekend' 
      else 'Businessday' End as Day_Type,

 case when month(to_timestamp(started_at)) in(12,1,2)
      then 'Winter'
      when month(to_timestamp(started_at)) in(3,4,5)
      then 'Spring'
      when month(to_timestamp(started_at)) in(6,7,8)
      then 'Summer'
      Else 'Autumn' End as Season 
  from {{ source('demo', 'bike') }}
)

select * 
  from cte