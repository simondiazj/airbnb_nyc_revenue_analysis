-- Airbnb NYC Revenue & Occupancy Analysis
-- Exploratory analysis queries run against the active-listings table.

-- 1. Revenue and occupancy by borough.
SELECT
  neighbourhood_group_cleansed AS borough,
  COUNT(*) AS listings,
  ROUND(AVG(estimated_revenue_l365d), 2) AS avg_estimated_revenue,
  ROUND(AVG(estimated_occupancy_l365d) / 365 * 100, 2) AS avg_occupancy_pct
FROM `rising-cable-468102-u6.Airbnb_NY.listings_active`
GROUP BY borough
ORDER BY avg_estimated_revenue DESC;

-- 2. Revenue and occupancy by room type.
SELECT
  room_type,
  COUNT(*) AS listings,
  ROUND(AVG(estimated_revenue_l365d), 2) AS avg_estimated_revenue,
  ROUND(AVG(estimated_occupancy_l365d) / 365 * 100, 2) AS avg_occupancy_pct
FROM `rising-cable-468102-u6.Airbnb_NY.listings_active`
GROUP BY room_type
ORDER BY avg_estimated_revenue DESC;

-- 3. Superhost comparison.
SELECT
  IF(host_is_superhost, 'Superhost', 'Regular Host') AS host_type,
  COUNT(*) AS listings,
  ROUND(AVG(estimated_revenue_l365d), 2) AS avg_estimated_revenue,
  ROUND(AVG(estimated_occupancy_l365d) / 365 * 100, 2) AS avg_occupancy_pct
FROM `rising-cable-468102-u6.Airbnb_NY.listings_active`
WHERE host_is_superhost IS NOT NULL
GROUP BY host_type
ORDER BY avg_estimated_revenue DESC;

-- 4. Relationships between listing characteristics and performance.
SELECT
  CORR(price, estimated_revenue_l365d) AS price_revenue_correlation,
  CORR(number_of_reviews, estimated_occupancy_l365d) AS reviews_occupancy_correlation,
  CORR(beds, estimated_revenue_l365d) AS beds_revenue_correlation
FROM `rising-cable-468102-u6.Airbnb_NY.listings_active`;

-- 5. Top neighborhoods by estimated revenue. A minimum of 30 listings makes
-- the ranking more reliable.
SELECT
  neighbourhood_cleansed AS neighbourhood,
  neighbourhood_group_cleansed AS borough,
  COUNT(*) AS listings,
  ROUND(AVG(estimated_revenue_l365d), 2) AS avg_estimated_revenue,
  ROUND(AVG(estimated_occupancy_l365d), 2) AS avg_estimated_occupancy_days
FROM `rising-cable-468102-u6.Airbnb_NY.listings_active`
GROUP BY neighbourhood, borough
HAVING COUNT(*) >= 30
ORDER BY avg_estimated_revenue DESC
LIMIT 10;
