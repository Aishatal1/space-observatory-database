# Space Observatory Database

A complete MySQL database for tracking galaxies, celestial bodies, space agencies, and missions.

## Database Schema

- **astronomy schema:** Galaxy clusters, galaxies, star systems, celestial bodies, orbital relationships, astronauts
- **agencies schema:** Space agencies, spacecraft, space missions

## Files

| File | Description |
|------|-------------|
| `00_schema.sql` | Creates all tables, schemas, and indexes |
| `01_insert_data.sql` | Sample data (galaxies, planets, missions, astronauts) |
| `02_queries.sql` | 10 example queries with JOINs, aggregations, subqueries |

## How to Run

```sql
-- In MySQL/MariaDB:
SOURCE 00_schema.sql;
SOURCE 01_insert_data.sql;
SOURCE 02_queries.sql;
