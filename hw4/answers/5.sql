with selected_users as (
    select user_id from review
    where user_id in (
        select review.user_id  
        join review on users.user_id = review.user_id
        having count(review.user_id) >= 200
    ) union 
    select user_id, business_id from tip
    where user_id in (
        select review.user_id from users 
        join review on users.user_id = review.user_id
        having count(review.user_id) >= 200
    )
)
select
a.user_id as user_id1, b.user_id as user_id2, count(*) as similarity
from selected_users a 
join selected_users b on a.business_id = b.business_id and a.user_id < b.user_id
limit 1;