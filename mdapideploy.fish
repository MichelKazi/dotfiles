function mdapideploy --argument-names 'name' 
	if [ -z "$argv" ] # if $argv is empty
		echo "Please supply a TPO"
		return
	else
		sfdx force:source:convert -d mdapiout
		sfdx force:mdapi:deploy -d mdapiout --wait 100 -u $name
		rm -rf mdapiout
	end
	
end

