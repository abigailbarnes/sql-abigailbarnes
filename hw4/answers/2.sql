With table_one as (select users.name,users.user_id,count(users.user_id) as review_c from users join review on review.user_id  = users.user_id group by users.user_id order by review_count desc, name limit 10)
Select avg(stars) as avg from review join table_one on table_one.user_id = review.user_id;