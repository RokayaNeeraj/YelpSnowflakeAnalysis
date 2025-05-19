-- Step 1: Create staging table for raw Yelp business data

create or replace table yelp_business (business_text variant)

--  Load Yelp business JSON data from AWS S3 into the Snowflake staging table

copy into yelp_business
from 's3://yelpanalysisnr/yelp_academic_dataset_business.json'
credentials = (
    AWS_KEY_ID = ''
    AWS_SECRET_KEY = ''
)
FILE_FORMAT = (TYPE = JSON);

-- Flatten the raw Yelp business JSON data into a structured table
-- Extract key fields like business_id, name, city, state stars, and categories

create or replace table tbl_yelp_business as
select business_text:business_id::string as business_id
,business_text:name::string as name
,business_text:city::string as city
,business_text:state::string as state
,business_text:stars::number as stars
,business_text:categories::string as categories
from yelp_business 