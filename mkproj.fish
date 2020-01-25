function mkproj --argument-names 'name' 'remote'

	if [ -z "$argv" ] # if $argv is empty
		echo "usage: mkproj <name> [<remote-to-repository>]"
		return
	else
		mkdir $name;
		cd $name;
		echo "# $name" >> README.md
		git init
		git add .
		git commit -m "Initial commit"

		if test -n "$remote" # if a link to a new repo is provided
			switch $remote
				case "http*"	
					git remote add origin $remote	
					git push -u origin master
					return
				case "github"	
					if type -q hub
						hub create
						git push -u origin master
						return
					else
						echo "You need to have Github's hub CLI installed"
					end
			end
			echo "$remote is not a valid link 😢"
		end
	end
	
end
