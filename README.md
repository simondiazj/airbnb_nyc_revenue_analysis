# 🏙️ Airbnb NYC Revenue & Occupancy Analysis

## 📌 Project Overview

This project analyzes Airbnb listings in New York City to identify the factors associated with higher **revenue and occupancy**.

The analysis uses data from **Inside Airbnb — New York City, April 2026 snapshot**. The project combines **SQL data cleaning and analysis in Google BigQuery** with **interactive data visualization in Tableau**.

The goal is to transform raw Airbnb listing data into actionable insights that can help hosts and property managers better understand the factors associated with stronger financial performance.

---

## 🎯 Business Question

> **What factors are associated with higher Airbnb revenue and occupancy in New York City?**

The analysis focuses on the following questions:

- Which NYC boroughs generate the highest revenue?
- Which neighborhoods perform best?
- Which room types generate the most revenue?
- Do Superhosts generate more revenue than regular hosts?
- Is higher listing price associated with higher revenue?
- Is there a relationship between reviews and occupancy?
- How does the number of beds relate to revenue?
- Where are the highest-revenue listings located?

---

## 📊 Dataset

**Source:** Inside Airbnb  
**Location:** New York City  
**Snapshot:** April 2026

The original `listings` dataset contains **35,036 listings**.

After data cleaning and filtering for active listings, the final analytical dataset contains:

**20,693 active listings**

The project also used Airbnb calendar data to support the analysis.

### Key variables

| Variable | Description |
|---|---|
| `id` | Unique Airbnb listing identifier |
| `neighbourhood_cleansed` | NYC neighborhood |
| `neighbourhood_group_cleansed` | NYC borough |
| `room_type` | Type of accommodation |
| `price` | Listing price |
| `estimated_revenue_l365d` | Estimated revenue over the last 365 days |
| `estimated_occupancy_l365d` | Estimated occupancy over the last 365 days |
| `number_of_reviews` | Total number of reviews |
| `reviews_per_month` | Average monthly reviews |
| `beds` | Number of beds |
| `host_is_superhost` | Superhost status |
| `latitude` | Listing latitude |
| `longitude` | Listing longitude |

> **Note:** `estimated_revenue_l365d` and `estimated_occupancy_l365d` are estimated metrics generated using Inside Airbnb's Occupancy Model.

---

## 🧹 Data Cleaning & Preparation

The data preparation process was performed using **SQL in Google BigQuery**.

### Main steps

1. Loaded the original Airbnb listings dataset into BigQuery.
2. Checked the dataset structure and data types.
3. Verified listing ID uniqueness and checked for duplicate records.
4. Investigated missing values across key variables.
5. Identified inactive listings using missing `price` and estimated performance metrics.
6. Created cleaned and analytical datasets.
7. Created the `listings_active` table containing the **20,693 active listings** used for the final analysis.
8. Standardized and prepared variables for exploratory analysis and Tableau visualization.

### Data quality findings

The original dataset contained:

- **35,036 total listings**
- **14,343 listings with NULL price**
- **14,343 listings with NULL estimated revenue**

These missing values were an important indicator that a significant portion of listings were not active or did not have sufficient activity for the performance analysis.

---

## 🔎 Exploratory Data Analysis

The analysis examined Airbnb performance across multiple dimensions.

### Revenue & Occupancy by Borough

| Borough | Listings | Avg. Revenue | Avg. Occupancy |
|---|---:|---:|---:|
| Manhattan | 9,111 | $20,003.86 | 68.72% |
| Brooklyn | 7,037 | $16,628.15 | 79.81% |
| Queens | 3,424 | $12,065.72 | 75.58% |
| Staten Island | 293 | $8,866.19 | 63.11% |
| Bronx | 828 | $7,868.69 | 60.86% |

Manhattan generated the highest average revenue per listing, while Brooklyn achieved the highest average occupancy.

---

## 🛏️ Room Type Analysis

The active listings were distributed across four room types:

| Room Type | Listings |
|---|---:|
| Entire home/apt | 11,003 |
| Private room | 9,164 |
| Shared room | 194 |
| Hotel room | 332 |

The analysis shows that **Entire home/apt** listings represent the largest segment of the active Airbnb market in NYC.

---

## ⭐ Superhost Analysis

Superhost status was also analyzed to determine whether it was associated with stronger financial performance.

| Host Type | Avg. Revenue |
|---|---:|
| Superhost | $34,084 |
| Regular Host | $9,349 |

Superhosts generated substantially higher average estimated revenue than regular hosts in the analyzed dataset.

This suggests that host reputation, operational quality, guest experience, and listing performance may be important factors associated with higher revenue.

---

## 📈 Correlation Analysis

Correlation analysis was used to explore relationships between listing characteristics and performance.

| Variable Pair | Correlation |
|---|---:|
| Price vs. Revenue | 0.198 |
| Reviews vs. Occupancy | 0.399 |
| Beds vs. Revenue | 0.410 |
| Reviews per Month vs. Revenue | 0.326 |

### Key interpretation

- **Price vs. Revenue:** A weak positive relationship. Higher prices alone do not strongly explain higher revenue.
- **Reviews vs. Occupancy:** A moderate positive relationship, suggesting listings with more reviews tend to have higher occupancy.
- **Beds vs. Revenue:** A moderate positive relationship, indicating larger listings may have greater revenue potential.
- **Reviews per Month vs. Revenue:** A positive relationship, suggesting more actively booked listings tend to generate higher revenue.

> Correlation does not imply causation. These relationships indicate associations within the analyzed dataset.

---

## 💡 Key Insights

### 1. Manhattan leads in revenue

Manhattan has the highest average revenue per active listing at approximately **$20K**, outperforming all other NYC boroughs.

### 2. Brooklyn leads in occupancy

Brooklyn has the highest average occupancy at approximately **79.8%**, indicating strong demand despite having lower average revenue than Manhattan.

### 3. Superhosts outperform regular hosts

Superhosts generated approximately **$34K average estimated revenue**, compared with approximately **$9.3K for regular hosts**.

This represents a substantial performance difference associated with Superhost status.

### 4. Price alone is not a strong revenue driver

The correlation between price and revenue is only **0.198**, suggesting that simply charging a higher nightly price does not necessarily result in substantially higher annual revenue.

### 5. Larger listings tend to generate more revenue

The correlation between beds and revenue is **0.410**, indicating a moderate positive relationship between listing capacity and estimated revenue.

### 6. Reviews are associated with stronger occupancy

The positive correlation between number of reviews and occupancy (**0.399**) suggests that listings with stronger review histories tend to experience higher occupancy.

---

## 🗺️ Tableau Dashboard

The final analysis was transformed into an interactive **Tableau dashboard**.

🔗 [Open the interactive Tableau dashboard](https://public.tableau.com/views/Book1_17833799981730/MarketAnalysis?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

The dashboard includes interactive buttons that allow users to select a room type or borough. All charts and metrics update dynamically, making it easy to compare performance across accommodation types and NYC boroughs.

- Borough
- Neighborhood
- Room type
- Superhost status
- Revenue
- Occupancy
- Price
- Reviews
- Listing location

### Interactive Map

The dashboard includes a geographic visualization showing Airbnb listings across New York City.

Users can click the borough buttons to focus the map on a specific area of New York City and use the room type buttons to filter listings by accommodation type. The map updates dynamically to display the location and performance of the selected listings.

### Dashboard Features

- KPI cards
- Interactive filters
- Revenue analysis
- Occupancy analysis
- Room type selector
- Borough comparison
- Neighborhood analysis
- Superhost comparison
- Correlation analysis
- Geographic map of listings

---

## 🛠️ Tools & Technologies

### Data Analysis

- **SQL**
- **Google BigQuery**

### Data Visualization

- **Tableau**

### Data Source

- **Inside Airbnb**

### Other Tools

- GitHub
- CSV
- Excel / Google Sheets

---

## 📂 Project Structure

```text
Airbnb_Project/
│
├── data/
│   └── Airbnb_listing_active.csv
│
├── sql/
│   ├── data_cleaning.sql
│   └── exploratory_analysis.sql
│
├── tableau/
│   └── Airbnb_NYC_Dashboard
│
└── README.md
```

---

## 🔄 Project Workflow

```text
Raw Airbnb Data
       ↓
Data Quality Assessment
       ↓
SQL Data Cleaning
       ↓
Active Listings Dataset
       ↓
Exploratory Data Analysis
       ↓
Correlation & Performance Analysis
       ↓
Business Insights
       ↓
Tableau Dashboard
       ↓
Business Recommendations
```

---

## 💼 Business Recommendations

Based on the analysis, Airbnb hosts and property managers could consider:

### Focus on location

Manhattan listings generate the highest average revenue, making location an important factor in revenue potential.

### Optimize for occupancy, not only price

Because price has only a weak correlation with revenue, hosts should consider balancing nightly rates with demand and occupancy rather than simply maximizing price.

### Improve guest experience

The relationship between reviews and occupancy suggests that maintaining strong guest satisfaction and review performance may contribute to higher occupancy.

### Consider property capacity

Listings with more beds tend to generate higher revenue, suggesting that larger properties can have greater revenue potential when demand supports the additional capacity.

### Learn from high-performing hosts

The large revenue difference between Superhosts and regular hosts suggests that operational quality, guest experience, and listing management practices may be important areas for improvement.

---

## ⚠️ Limitations

This analysis has several limitations:

- Revenue and occupancy are **estimated metrics**, not Airbnb-reported financial results.
- Correlation analysis identifies relationships but does not establish causation.
- The dataset represents a snapshot of Airbnb listings in **April 2026**.
- Market conditions, seasonality, regulations, and competitive dynamics can change over time.
- The analysis does not include Airbnb operating expenses, taxes, cleaning costs, or net profit.

Therefore, the results should be interpreted as **associations within the analyzed dataset**, rather than definitive causal relationships.

---

## 🎓 Project Purpose

This project was developed as part of my **Data Analytics portfolio** to demonstrate practical skills in:

- Data cleaning
- SQL
- Exploratory Data Analysis
- Business analysis
- Statistical interpretation
- Data visualization
- Dashboard development
- Translating data into actionable business insights

---

## 👤 Author

**Simon Diaz**

**Data Analyst | Supply Chain & Operations**

📍 Orlando, FL

### Skills

SQL • BigQuery • Tableau • Excel • Data Analysis • Supply Chain Analytics • Inventory Analysis

---

## ⭐ Project Highlights

**35,036** original listings  
**20,693** active listings  
**5** NYC boroughs analyzed  
**4** room types analyzed  
**$20K** Manhattan average revenue  
**79.8%** Brooklyn average occupancy  
**$34K** Superhost average revenue

---

*This project is intended for analytical and educational purposes and is based on publicly available Inside Airbnb data.*
