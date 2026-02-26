
build :
	mv ../universe-pkgbuild/x86_64/*/*.pkg.tar.zst x86_64/ && repo-add -n -R x86_64/universe.db.tar.gz x86_64/*.pkg.tar.zst && mv x86_64/universe.db.tar.gz x86_64/universe.db && mv x86_64/universe.files.tar.gz x86_64/universe.files
