#!/bin/bash
PATCH="2022-12-20"

cd ..
echo -n "Backing up... "
cp -R online-judge-custom online-judge-custom.backup
echo "OK"
echo

echo "Undoing custom changes:"
cd online-judge-custom
git reset origin/master --hard
echo

echo "Downloading remote changes"
git pull origin master
echo

echo "Patching with custom changes:"
cd ..
for f in online-judge-patches/$PATCH/*; do
    patch -p1 < "$f"
done
echo "Done!"