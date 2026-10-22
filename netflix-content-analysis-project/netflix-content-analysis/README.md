# Netflix Content Analysis

## Project objective
Explore the composition of the Netflix catalogue represented in the supplied dataset by content type, rating, genre/category, country, release year, and date added.

## Project contents
- `data/raw/`: original uncleaned CSV.
- `data/working-files/`: intermediate and final cleaned CSV/XLSX versions.
- `sql/`: original SQL scripts renamed by workflow stage; SQL content preserved.
- `power-bi/`: supplied Power BI `.pbix` dashboard.
- `assets/`: supplied image assets.
- `results/`: profiling and summary CSVs.
- `documentation/`: project status, findings, and report.

## Key file versions
- Raw source: 8,807 rows, 12 columns.
- Intermediate cleaned CSV: 8,790 rows, 10 columns.
- Final cleaned CSV/XLSX: 8,390 rows, 12 columns.

## Important limitations
The final version removes 417 rows compared with the raw dataset. Review deletion logic and document the reason for each exclusion. Some missing values were inferred from patterns in other records; treat these as assumptions until validated. `Not Given` should be handled as unknown rather than a real category. The dataset does not contain viewing counts, revenue, or user ratings, so do not make claims about title popularity or business performance.

## How to continue
1. Open `power-bi/netflix-visualization.pbix` in Power BI Desktop and verify source paths, visuals, measures, and filters.
2. Use `results/data-profiling-summary.csv` to compare the three data versions.
3. Review `sql/02-follow-up-cleaning.sql`, especially the imputations and delete rules, before presenting the cleaned data as final.
4. Build or validate dashboard visuals for content type, rating, genre, country, release year, and date added.
