-- Array

EXPLAIN ANALYZE SELECT * FROM visit WHERE (purposes = ARRAY['Refueling']::varchar[]);
/* 
 Gather  (cost=1000.00..8740973.00 rows=1343929 width=1164) (actual time=64.985..274696.874 rows=1387627 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Parallel Seq Scan on visit  (cost=0.00..8605580.10 rows=559970 width=1164) (actual time=101.194..267960.215 rows=462542 loops=3)
         Filter: (purposes = '{Refueling}'::character varying[])
         Rows Removed by Filter: 16204126
 Planning Time: 0.138 ms
 JIT:
   Functions: 6
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 6.056 ms, Inlining 198.160 ms, Optimization 44.269 ms, Emission 49.238 ms, Total 297.724 ms
 Execution Time: 274884.292 ms
*/
 
CREATE INDEX gin_array ON visit USING GIN (purposes);
EXPLAIN ANALYZE SELECT * FROM visit WHERE (purposes = ARRAY['Refueling']::varchar[]);
/*
 Gather  (cost=30806.84..3952309.50 rows=1343334 width=1164) (actual time=5655.259..364102.967 rows=1387627 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Parallel Bitmap Heap Scan on visit  (cost=29806.84..3816976.10 rows=559722 width=1164) (actual time=5672.778..363542.490 rows=462542 loops=3)
         Recheck Cond: (purposes = '{Refueling}'::character varying[])
         Rows Removed by Index Recheck: 16015815
         Heap Blocks: exact=10491 lossy=2729334
         ->  Bitmap Index Scan on gin_array  (cost=0.00..29471.00 rows=1343334 width=0) (actual time=5604.453..5604.454 rows=29167541 loops=1)
               Index Cond: (purposes = '{Refueling}'::character varying[])
 Planning Time: 1.828 ms
 JIT:
   Functions: 6
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 7.122 ms, Inlining 240.369 ms, Optimization 40.629 ms, Emission 32.956 ms, Total 321.077 ms
 Execution Time: 364274.820 ms
*/
 
EXPLAIN ANALYZE SELECT purposes FROM visit WHERE (purposes = ARRAY['Refueling']::varchar[]);
/*
 Gather  (cost=30806.84..3952309.50 rows=1343334 width=72) (actual time=3685.723..365259.852 rows=1387627 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Parallel Bitmap Heap Scan on visit  (cost=29806.84..3816976.10 rows=559722 width=72) (actual time=3662.825..365021.366 rows=462542 loops=3)
         Recheck Cond: (purposes = '{Refueling}'::character varying[])
         Rows Removed by Index Recheck: 16015815
         Heap Blocks: exact=10467 lossy=2733003
         ->  Bitmap Index Scan on gin_array  (cost=0.00..29471.00 rows=1343334 width=0) (actual time=3532.756..3532.756 rows=29167541 loops=1)
               Index Cond: (purposes = '{Refueling}'::character varying[])
 Planning Time: 12.997 ms
 JIT:
   Functions: 12
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 1.549 ms, Inlining 197.990 ms, Optimization 65.100 ms, Emission 137.416 ms, Total 402.055 ms
 Execution Time: 365535.898 ms
*/

 -- Full text
 
EXPLAIN ANALYZE SELECT * FROM visit WHERE to_tsvector('english', report) @@ to_tsquery('english', 'price');
/*
 Gather  (cost=1000.00..13839798.88 rows=250000 width=1164) (actual time=81.970..1467831.153 rows=35003999 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Parallel Seq Scan on visit  (cost=0.00..13813798.88 rows=104167 width=1164) (actual time=91.642..1463796.797 rows=11668000 loops=3)
         Filter: (to_tsvector('english'::regconfig, (report)::text) @@ '''price'''::tsquery)
         Rows Removed by Filter: 4998669
 Planning Time: 0.168 ms
 JIT:
   Functions: 6
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 280.723 ms, Inlining 159.628 ms, Optimization 82.023 ms, Emission 30.560 ms, Total 552.934 ms
 Execution Time: 1469551.184 ms
*/
 
CREATE INDEX gin_text ON visit USING GIN (to_tsvector('english', report));
EXPLAIN ANALYZE SELECT * FROM visit WHERE to_tsvector('english', report) @@ to_tsquery('english', 'price');
/*
 Gather  (cost=21537.50..5649683.11 rows=250000 width=1164) (actual time=4571.771..1535031.795 rows=35003999 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Parallel Bitmap Heap Scan on visit  (cost=20537.50..5623683.11 rows=104167 width=1164) (actual time=4255.082..1531265.709 rows=11668000 loops=3)
         Recheck Cond: (to_tsvector('english'::regconfig, (report)::text) @@ '''price'''::tsquery)
         Rows Removed by Index Recheck: 4982438
         Heap Blocks: exact=5811 lossy=2754170
         ->  Bitmap Index Scan on gin_text  (cost=0.00..20475.00 rows=250000 width=0) (actual time=4425.179..4425.180 rows=35003999 loops=1)
               Index Cond: (to_tsvector('english'::regconfig, (report)::text) @@ '''price'''::tsquery)
 Planning Time: 31.053 ms
 JIT:
   Functions: 6
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 16.728 ms, Inlining 246.797 ms, Optimization 122.863 ms, Emission 53.637 ms, Total 440.025 ms
 Execution Time: 1536499.133 ms
*/

EXPLAIN ANALYZE SELECT report FROM visit WHERE to_tsvector('english', report) @@ to_tsquery('english', 'price');

-- Json

EXPLAIN ANALYZE SELECT * FROM visit WHERE (summary ? 'arrival date') AND (date (summary->>'arrival date') > date '2010-01-01');
/*
 Seq Scan on visit  (cost=0.00..9470048.18 rows=16665003 width=1164) (actual time=230.731..276438.885 rows=253279 loops=1)
   Filter: ((summary ? 'arrival date'::text) AND (((summary ->> 'arrival date'::text))::date > '2010-01-01'::date))
   Rows Removed by Filter: 49746727
 Planning Time: 4.116 ms
 JIT:
   Functions: 2
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 5.804 ms, Inlining 61.456 ms, Optimization 91.768 ms, Emission 72.162 ms, Total 231.190 ms
 Execution Time: 276495.044 ms
*/

CREATE INDEX gin_json ON visit USING GIN (summary);
EXPLAIN ANALYZE SELECT * FROM visit WHERE (summary ? 'arrival date') AND (date (summary->>'arrival date') > date '2010-01-01');
/*
 Seq Scan on visit  (cost=0.00..9470048.18 rows=16665003 width=1164) (actual time=864.646..276684.795 rows=253279 loops=1)
   Filter: ((summary ? 'arrival date'::text) AND (((summary ->> 'arrival date'::text))::date > '2010-01-01'::date))
   Rows Removed by Filter: 49746727
 Planning Time: 7.564 ms
 JIT:
   Functions: 2
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 47.827 ms, Inlining 109.983 ms, Optimization 356.995 ms, Emission 395.131 ms, Total 909.936 ms
 Execution Time: 276789.818 ms
*/

EXPLAIN ANALYZE SELECT * FROM visit WHERE summary ? 'arrival date';
/*
 Seq Scan on visit  (cost=0.00..8970048.10 rows=49995008 width=1164) (actual time=191.139..322839.110 rows=50000003 loops=1)
   Filter: (summary ? 'arrival date'::text)
   Rows Removed by Filter: 3
 Planning Time: 5.382 ms
 JIT:
   Functions: 2
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 9.872 ms, Inlining 25.595 ms, Optimization 103.269 ms, Emission 62.234 ms, Total 200.970 ms
 Execution Time: 324833.284 ms
*/

EXPLAIN ANALYZE SELECT summary FROM visit WHERE summary ? 'arrival date';
/*
 Seq Scan on visit  (cost=0.00..8970048.10 rows=49995008 width=605) (actual time=62.545..295127.331 rows=50000003 loops=1)
   Filter: (summary ? 'arrival date'::text)
   Rows Removed by Filter: 3
 Planning Time: 4.812 ms
 JIT:
   Functions: 4
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 0.306 ms, Inlining 6.129 ms, Optimization 25.064 ms, Emission 31.122 ms, Total 62.621 ms
 Execution Time: 297049.213 ms
*/

-- Partitioning

CREATE TABLE ship_part (
    ship_id bigserial,
    ship_name varchar
        NOT NULL,
    ship_type varchar
        NOT NULL,
    homeport_id integer
        REFERENCES port
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    displacement integer
        NOT NULL
        CONSTRAINT positive_displacement
            CHECK (displacement > 0),
	PRIMARY KEY (ship_id, displacement)
) PARTITION BY RANGE (displacement);

CREATE TABLE ship_part_90000_100000
PARTITION OF ship_part FOR VALUES FROM (90000) TO (100001);

CREATE TABLE ship_part_0_90000
PARTITION OF ship_part FOR VALUES FROM (0) TO (90000);

INSERT INTO ship_part SELECT * FROM ship;

EXPLAIN ANALYZE SELECT * FROM ship JOIN port ON (homeport_id = port_id) WHERE displacement > 9155;
/*
 Hash Join  (cost=3.86..36448.48 rows=999900 width=86) (actual time=0.909..390.374 rows=1000000 loops=1)
   Hash Cond: (ship.homeport_id = port.port_id)
   ->  Seq Scan on ship  (cost=0.00..22696.00 rows=999900 width=50) (actual time=0.235..183.922 rows=1000000 loops=1)
         Filter: (displacement > 9155)
   ->  Hash  (cost=2.27..2.27 rows=127 width=36) (actual time=0.229..0.231 rows=47 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 11kB
         ->  Seq Scan on port  (cost=0.00..2.27 rows=127 width=36) (actual time=0.216..0.219 rows=47 loops=1)
 Planning Time: 4.397 ms
 Execution Time: 424.707 ms
*/

EXPLAIN ANALYZE SELECT * FROM ship_part_90000_100000 JOIN port ON (homeport_id = port_id) WHERE displacement > 9155;
/*
 Hash Join  (cost=3.86..4047.12 rows=110938 width=86) (actual time=0.426..87.997 rows=110949 loops=1)
   Hash Cond: (ship_part_90000_100000.homeport_id = port.port_id)
   ->  Seq Scan on ship_part_90000_100000  (cost=0.00..2517.86 rows=110938 width=50) (actual time=0.374..41.617 rows=110949 loops=1)
         Filter: (displacement > 9155)
   ->  Hash  (cost=2.27..2.27 rows=127 width=36) (actual time=0.035..0.037 rows=47 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 11kB
         ->  Seq Scan on port  (cost=0.00..2.27 rows=127 width=36) (actual time=0.009..0.018 rows=47 loops=1)
 Planning Time: 1.236 ms
 Execution Time: 95.953 ms
*/