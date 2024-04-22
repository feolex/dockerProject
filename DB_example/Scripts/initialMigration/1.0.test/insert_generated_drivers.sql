insert into taxcar.Driver(PhoneNumber, Rating)
select generate_series(1, 100)::int4, random()::float4
from generate_series(1, 10) as gs