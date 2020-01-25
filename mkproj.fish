function mkproj
	mkdir $argv;
	cd $argv;
	git init
	echo "# $argv" >> README.md
end
