#!/bin/bash

# Build script to inject environment variables into index.html
# This runs during Netlify build

# Copy index.html to a temporary location
cp index.html index.html.tmp

# Replace placeholders with environment variables
sed -i "s/TMDB_API_KEY_PLACEHOLDER/${TMDB_API_KEY}/g" index.html.tmp
sed -i "s|SUPABASE_URL_PLACEHOLDER|${SUPABASE_URL}|g" index.html.tmp
sed -i "s/SUPABASE_KEY_PLACEHOLDER/${SUPABASE_KEY}/g" index.html.tmp

# Move the processed file back
mv index.html.tmp index.html

echo "Environment variables injected successfully!"
