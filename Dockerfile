FROM postgres:13

# Install PostGIS
RUN apt-get update \
    && apt-get install -y \
        postgresql-13-postgis-3 \
        postgresql-13-postgis-3-scripts \
    && rm -rf /var/lib/apt/lists/*

# Create the PostGIS extension
RUN mkdir -p "/docker-entrypoint-initdb.d" \
    && echo "CREATE EXTENSION IF NOT EXISTS postgis;" > /docker-entrypoint-initdb.d/postgis_o125.sql
