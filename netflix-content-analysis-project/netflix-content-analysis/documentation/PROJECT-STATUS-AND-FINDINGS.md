# Netflix Content Analysis — Project Status and Findings

## What is included
- Original dataset: 8,807 rows and 12 columns.
- Intermediate cleaned CSV: 8,790 rows and 10 columns.
- Final cleaned CSV/XLSX: 8,390 rows and 12 columns.
- Three SQL scripts for initial profiling/cleaning, follow-up cleaning, and staging investigations.
- Power BI file: `power-bi/netflix-visualization.pbix` (present in the uploaded archive; its visuals/measures have not been independently audited here).
- Basic profiling and exploratory summary CSVs generated for review.

## Verified high-level findings from the final CSV
- Final table contains 8,390 records: 6,069 Movies (72.3%) and 2,321 TV Shows (27.7%).
- Most common rating label: TV-MA (3,062 records).
- Most frequently listed genre/category mention: International Movies (2,739 title mentions).
- Most frequently listed country mention: United States (3,718 title mentions).
- Parsed `date_added` range: 01 Jan 2008 to 25 Sep 2021.
- Final `date_added` has 0 values that did not parse under mixed-format date parsing; investigate before time-based reporting.

## Cleaning and interpretation cautions
- The final CSV has 417 fewer rows than the original (8,807 to 8,390). The SQL includes deletion rules, so the removed rows should be documented and justified before calling the result fully clean.
- The final CSV uses the literal `Not Given` in some fields, which is not a true value and should be treated as a missing/unknown category in analysis.
- The SQL scripts infer/fill some missing country/director values from other records using country/director/cast/genre patterns. These are assumptions, not verified ground truth; review before relying on them.
- `main.sql` contains a local Windows file path for loading the source CSV. Update it for the target MySQL environment before rerunning.
- The intermediate CSV has 10 columns and excludes `cast` and `description`; the final CSV has 11 columns and excludes `description` but includes `cast`.
- The source archive includes a Power BI `.pbix`, so this project already has a dashboard artifact. The dashboard’s visual design, calculations, and source connections should be checked in Power BI Desktop before publishing or presenting.

## Suggested business framing
**Business question:** What does the Netflix catalogue in this dataset look like by content type, maturity rating, genre, country, release year, and date added?

**Scope limitation:** This is a catalogue snapshot, not viewership, popularity, revenue, or audience-engagement data. It cannot establish which titles perform best or why customers watch them.
