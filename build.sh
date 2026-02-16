#!/bin/bash

# Build script to inject environment variables into index.html
# This runs during Netlify build

# Copy index.html to a temporary location
cp index.html index.html.tmp

# Replace placeholders with environment variables
sed -i "s/8c286f4cfc6e72c52efc6017f997af38/${TMDB_API_KEY}/g" index.html.tmp
sed -i "s|https://jqlmdlzcnkqveelpybcv.supabase.co|${SUPABASE_URL}|g" index.html.tmp
sed -i "s/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpxbG1kbHpjbmtxdmVlbHB5YmN2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzExMjUyMjYsImV4cCI6MjA4NjcwMTIyNn0.rH8uf56epH4iESZ_Ya1h8f_sCiHoNKgn1lYlVXz5ErU/${SUPABASE_KEY}/g" index.html.tmp

# Move the processed file back
mv index.html.tmp index.html

echo "Environment variables injected successfully!"
