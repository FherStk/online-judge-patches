#!/bin/bash
PATCH="2022-12-20"

echo "Undoing custom changes"
cd ../online-judge-custom
git reset origin/master --hard

echo "Downloading remote changes"
git pull origin master

echo "Patching with custom changes:"
cd ..
for f in online-judge-patches/$PATCH/*; do
    patch -p1 < "$f"
    echo "Aplying patch: $f"
done