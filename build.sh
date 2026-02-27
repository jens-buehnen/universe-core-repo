#/bin/env bash

files=$(find ../universe-pkgbuild/x86_64 -type f -name "*.pkg.tar.zst*")
echo $files

for x in ${files}
do
    mv "${x}" x86_64/
done

repo-add -n -R x86_64/universe.db.tar.gz x86_64/*.pkg.tar.zst
mv x86_64/universe.db.tar.gz x86_64/universe.db
mv x86_64/universe.files.tar.gz x86_64/universe.files
