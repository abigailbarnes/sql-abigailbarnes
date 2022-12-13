select avg(avgscore),maxplayers from games where (maxplaytime < 100) group by maxplayers order by maxplayers ASC;
