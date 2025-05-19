-- Create staging table for raw Yelp review data (loaded as VARIANT from JSON)
create or replace table yelp_reviews (review_text variant)

--  Load Yelp review JSON data from AWS S3 into the Snowflake staging table
copy into yelp_reviews
from 's3://yelpanalysisnr/yelp/'
credentials = (
    AWS_KEY_ID = ''
    AWS_SECRET_KEY = ''
)
FILE_FORMAT = (TYPE = JSON);

-- Flatten the raw Yelp review JSON data into a structured table
-- Extract key fields like business_id, date, user_id, stars, and text
-- Add a sentiment classification using the `analyze_sentiment()` function
create or replace table tbl_yelp_reviews as 
select review_text:business_id::string as business_id 
,review_text:date::date as review_date
,review_text:user_id::string as user_id
,review_text:stars::number as review_star
,review_text:text::string as review_text 
,analyze_sentiment(review_text) as sentiments
from yelp_reviews