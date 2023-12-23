#!/bin/bash
PATCH="2023-07-04"

cd ..
echo "Backing up:"
cp -Rrf online-judge-custom online-judge-custom.backup
cp -Rrf online-judge-source online-judge-source.backup
echo "Done!"
echo

echo "Undoing custom changes:"
cd online-judge-custom
git reset origin/master --hard
echo "Done!"
echo

echo "Downloading remote changes"
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
rm -rf online-judge-custom
cp -r online-judge-source online-judge-custom

rm -rf online-judge-source
cp -r online-judge-source.backup online-judge-source

rm -rf online-judge-source.backup
echo "Done!"
echo

echo "Finished!"