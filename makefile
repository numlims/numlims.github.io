# numlims.github.io makefile

# when adding a new directory, also add a link to it in index.html

publish:
	git add --all 
	git commit -m "update"
	git push
