function mkcd --argument-names 'name' 

	if [ -z "$argv" ] # if $argv is empty
		echo "usage: mkcd <name> "
		return
	else
		mkdir $name;
		cd $name;
	end
	
end

