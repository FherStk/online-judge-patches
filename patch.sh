#!/bin/bash
PATCH="2023-12-23"

cd ..
echo "Backing up:"
cp -Rrf online-judge-custom online-judge-custom.backup
cp -Rrf online-judge-production online-judge-production.backup
echo "Done!"
echo

echo "Undoing changes for 'production':"
cd online-judge-production
git reset origin/master --hard
echo "Done!"
echo

echo "Downloading remote changes for 'production'"
git pull origin master
echo "Done!"
echo

echo "Patching with custom changes:"
cd ..
for f in online-judge-patches/$PATCH/*; do
    patch -p1 -f < "$f"
done
echo "Done!"
echo 

echo "Setting up project folders:"
rm -rf online-judge-production
mv online-judge-custom online-judge-production
mv online-judge-custom.backup online-judge-custom

echo "Done: the 'production' folder contains the latest version of the code (and patched)!"
echo

echo "Finished!"