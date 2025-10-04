#!/bin/bash
# Fix Flutter build for Vercel deployment

# Fix flutter_bootstrap.js - remove empty object from builds array
sed -i 's/"builds":\[\(.*\),{}\]/"builds":[\1]/g' flutter_app/build/web/flutter_bootstrap.js

echo "Build fixed successfully!"
