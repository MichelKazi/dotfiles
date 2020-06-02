function venvinit --argument-names 'name' 

	if test -e ./venv
		echo (set_color green) "Sourcing existing env directory" (set_color normal)
    source ./venv/bin/activate.fish
		return
	else
    python3 -m virtualenv venv
    source ./venv/bin/activate.fish
    echo (set_color green) "A virtual environment was created in the venv/ directory"
    echo "Please consider adding the directory to your .gitignore" (set_color normal)
	end
	
end

