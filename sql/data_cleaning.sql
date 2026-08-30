-- Airbnb NYC Revenue & Occupancy Analysis
-- Data cleaning and analytical-table creation in Google BigQuery

CREATE OR REPLACE TABLE `rising-cable-468102-u6.Airbnb_NY.listings_clean` AS
SELECT
  id,
  host_id,
  neighbourhood_group_cleansed,
  neighbourhood_cleansed,
  latitude,
  longitude,
  property_type,
  room_type,
  accommodates,
  bedrooms,
  beds,
  bathrooms_text,
  price,
  host_is_superhost,
  number_of_reviews,
  review_scores_rating,
  availability_365,
  estimated_occupancy_l365d,
  estimated_revenue_l365d
FROM `rising-cable-468102-u6.Airbnb_NY.listings`;

CREATE OR REPLACE TABLE `rising-cable-468102-u6.Airbnb_NY.listings_active` AS
SELECT
  id,
  host_id,
  neighbourhood_group_cleansed,
  neighbourhood_cleansed,
  latitude,
  longitude,
  property_type,
  room_type,
  accommodates,
  bedrooms,
  beds,
  bathrooms_text,
  price,
  host_is_superhost,
  number_of_reviews,
  review_scores_rating,
  availability_365,
  estimated_occupancy_l365d,
  estimated_revenue_l365d
FROM `rising-cable-468102-u6.Airbnb_NY.listings`
WHERE price IS NOT NULL
  AND estimated_revenue_l365d IS NOT NULL;

-- Validation checks
SELECT COUNT(*) AS clean_records
FROM `rising-cable-468102-u6.Airbnb_NY.listings_clean`;

SELECT COUNT(*) AS active_records
FROM `rising-cable-468102-u6.Airbnb_NY.listings_active`;


