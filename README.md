# 🎬 SQLFlix: IMDb 1000 Movies Analysis

Welcome to **SQLFlix**, a SQL-based data exploration project analyzing the IMDb Top 1000 Movies. I used SQL to uncover patterns and trends in genres, ratings, durations, and actor appearances.

## 👩‍💻 Author  
**Zainab Noushab**  
Computer Science & Computational Mathematics Student  
Aspiring Data Analyst | Passionate about storytelling through data ✨

---

## 📁 Project Structure
```
📂 SQLFlix/
├── sqlflix_analysis.sql         # All SQL queries with comments and insights
├── IMDb_Top_1000_Movies.xlsx    # Original dataset (Excel format)
└── README.md                    # Project documentation
```

---

## 🗂 Dataset Details
- **Title**: IMDb Top 1000 Movies  
- **Source**: Kaggle  
- **Author**: [omarhanyyy](https://www.kaggle.com/datasets/omarhanyyy/imdb-top-1000-movies)  
- **Format**: Excel (.xlsx)

---

## 🛠 Tools Used  
- MySQL Workbench  
- Excel (for initial dataset review)  
- SQL (Structured Query Language)

---

## 📌 Project Description

This project is divided into 3 progressive levels:

### 🔹 Basic Level Queries
- Top 10 Highest-Rated Movies  
- Top 5 Longest Movies  
- Most Common Movie Certificates  
- Common Durations  
- Sample Casts

### 🔸 Intermediate Level Queries
- Average Rating by Genre  
- Genre + Certificate Pairing  
- Extracting Top Actors by Frequency (creating new table)

### 🔺 Advanced Level Queries
- Top 3 Movies per Genre using `RANK()`  
- Movies with Above-Average Ratings using CTE  
- Certificate Types with High Frequency using `HAVING`

---

## 📊 SQL Concepts Used
- Data Filtering (`WHERE`, `ORDER BY`, `LIMIT`)  
- Aggregation (`COUNT`, `AVG`)  
- Grouping (`GROUP BY`, `HAVING`)  
- String Manipulation (`SUBSTRING_INDEX`, `TRIM`)  
- Table Creation and Insertion  
- CTEs and Window Functions (`RANK OVER PARTITION BY`)

---

## 🔍 Insights Discovered
- Christopher Nolan's movies dominate top ratings  
- Drama and Action are the most frequent genres  
- PG-13 and R are the most common certificates  
- Longest films extend beyond 180 minutes  
- A few actors appear across many top movies  
- Genre + certificate combinations reveal rating patterns

---

## 📫 Let’s Connect!
I'm excited to keep building and sharing projects like this.  
📍[LinkedIn – Zainab Noushab](https://www.linkedin.com/in/zainabnoushab)  
📍[GitHub – zainabnoushab](https://github.com/zainabnoushab)

---

> 💡 *“Data tells a story. SQLFlix is mine — where code meets cinema.”*
