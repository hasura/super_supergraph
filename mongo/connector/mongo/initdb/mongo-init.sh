#!/bin/bash

# Wait for MongoDB to be ready
echo "Waiting for MongoDB to start..."
until mongosh --host localhost --eval "print(\"Connection successful\")"
do
    sleep 2
done

echo "MongoDB started. Importing JSON files..."

# Import JSON files
for file in /docker-entrypoint-initdb.d/*.json
do
    if [ -f "$file" ]; then
        collection=$(basename "$file" .json)
        echo "Importing $file into collection $collection"
        mongoimport --host localhost --port 27017 --username root --password example --authenticationDatabase admin --db Chinook --collection $collection --file $file --jsonArray
    fi
done

echo "JSON files imported successfully."
