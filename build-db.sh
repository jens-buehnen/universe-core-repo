#!/usr/bin/env bash
#
# Script name: build-db.sh
# Description: Script for rebuilding the database for dtos-core-repo.
# GitLab: https://www.gitlab.com/dwt1/dtos-core-repo
# Contributors: Derek Taylor

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.
set -euo pipefail

x86_pkgbuild=$(find ../universe-pkgbuild/x86_64 -type f -name "*.pkg.tar.zst*")

for x in ${x86_pkgbuild}; do
  mv "${x}" x86_64/
  echo "Moving ${x}"
done

echo "###########################"
echo "Building the repo database."
echo "###########################"

## Arch: x86_64
cd x86_64

echo "###################################"
echo "Building for architecture 'x86_64'."
echo "###################################"

## repo-add
## -s: signs the packages
## -n: only add new packages not already in database
## -R: remove old package files when updating their entry
repo-add -s -n -R universe.db.tar.gz *.pkg.tar.zst

# Removing the symlinks because GitLab can't handle them.
rm universe.db
rm universe.db.sig
rm universe.files
rm universe.files.sig

# Renaming the tar.gz files without the extension.
mv universe.db.tar.gz universe.db
mv universe.db.tar.gz.sig universe-db.sig
mv universe.files.tar.gz universe.files
mv universe.files.tar.gz.sig universe.files.sig

echo "#######################################"
echo "Packages in the repo have been updated!"
echo "#######################################"
