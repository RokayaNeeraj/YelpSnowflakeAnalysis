# 🧊 Yelp Dataset Analysis (Snowflake + S3 + Python)

This project analyzes the Yelp Academic Dataset using **Snowflake SQL**, **AWS S3**, and **Python** for preprocessing and sentiment analysis.

## 📦 Dataset Components
- `yelp_business.json`: ~100MB
- `yelp_review.json`: ~5GB (split into chunks for loading)

## 💾 Data Processing
- Raw data uploaded to **AWS S3**
- Loaded into **Snowflake** using `COPY INTO` from external stage
- Flattened into structured tables:
  - `tbl_yelp_business`
  - `tbl_yelp_reviews`
- Sentiment analysis performed using **TextBlob** and stored in a new column

## 📊 Key Analyses
- Top business categories
- Most active users by review count
- Monthly review trends
- % of 5-star reviews per business
- Top reviewed businesses by city
- Sentiment-based ranking of businesses

## 📁 SQL Files

| File Name        | Description                             |
|------------------|-----------------------------------------|
| `yelp_reviews.sql`  | Load raw review data into Snowflake    |
| `yelp_business.sql` | Load and transform business data       |
| `yelp_sentiment.sql`| Add sentiment column using TextBlob   |
| `yelp_analysis.sql` | SQL queries for business insights     |

## 📌 Note
This project uses only `review` and `business` data from Yelp Academic Dataset.

## 👨‍💻 Author
Niraj Rokaya  
[LinkedIn](https://www.linkedin.com/in/nirajrokaya)
