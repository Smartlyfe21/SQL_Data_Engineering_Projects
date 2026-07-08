--duckdb dw_marts.duckdb -c ".read build_dw_marts.sql"



-- step 1:  DW -Create star scheme tables
.read 01_create_tables_dw.sql

-- step 2: DW -load data from csv files into tables 
.read 02_load_schema_dw.sql


-- step 3: Mart - Create flat mart
.read 03_create_flat_mart.sql


--step 4: Mart create skills demand mart
.read 04_create_skills_mart.sql