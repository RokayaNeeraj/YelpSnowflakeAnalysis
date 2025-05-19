-- Step 1: Create a sample table 'reviews' to test sentiment analysis

create or replace table reviews (review varchar(200));

-- Step 2: Insert sample reviews with varying sentiments

insert into reviews values(' I love this product! It works perfectly');
insert into reviews values(' This product is okay, but it could be better');
insert into reviews values(' I hate this product. It stopped working after a week');
insert into reviews values(' This product is okay. Not that great');
insert into reviews values(' This product is not good. But I can use');

-- Step 3: Create a Python UDF (User-Defined Function) for sentiment analysis

select review, analyze_sentiment(review) from reviews
CREATE OR REPLACE FUNCTION analyze_sentiment(text STRING)
RETURNS STRING
LANGUAGE PYTHON
RUNTIME_VERSION = '3.12'
PACKAGES = ('textblob')
HANDLER = 'sentiment_analyzer'
AS $$
from textblob import TextBlob
def sentiment_analyzer(text):
    analysis = TextBlob(text)
    if analysis.sentiment.polarity > 0:
        return 'Positive'
    elif analysis.sentiment.polarity ==0:
        return 'Neutral'
    else:
        return 'Negative'
$$
-- Step 4: Query the reviews along with their sentiment classification
SELECT 
    review, 
    analyze_sentiment(review) AS sentiment
FROM reviews;