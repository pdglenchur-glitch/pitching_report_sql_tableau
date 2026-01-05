# Pitching Analytics Dashboard (Postgres + Tableau)

## Overview
This project demonstrates an end-to-end analytics pipeline for baseball pitch tracking data,
from raw CSV ingestion through Postgres transformations to an interactive Tableau Public dashboard.

The dashboard provides:
- Pitch movement visualization
- Velocity trends over time
- Strike zone location analysis
- Pitch-type summary statistics
- Expanded probabilistic strike zone (PZR) evaluation

## Tech Stack
- PostgreSQL (data ingestion and transformation)
- SQL (staging, cleaning, analytics view)
- Tableau Public (interactive visualization)

## Project Structure Notes
- `sql/` – All SQL scripts used to build the analytics pipeline
- `tableau/` – Link to the published Tableau Public dashboard

## SQL Pipeline
The SQL pipeline follows a standard staging → raw → analytics pattern:

1. Create staging table for raw CSV ingestion  
2. Create typed raw table  
3. Insert and clean data from staging into raw  
4. Create analytics view (`pitches_analytics`) used by Tableau  
5. Export analytics view to CSV for visualization  


## Tableau Dashboard
The interactive dashboard is published on Tableau Public:

**[View Dashboard](https://public.tableau.com/shared/RHDJN4G2Z?:display_count=n&:origin=viz_share_link)**

## Reproducibility
To reproduce this project:
1. Load raw pitch CSVs into the staging table
2. Run SQL scripts in numerical order
3. Export `pitches_analytics` using the provided SQL
4. Connect Tableau to the exported CSV

