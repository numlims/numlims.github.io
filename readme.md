# numlims.github.io

this repo contains the api docs on [numlims.github.io](https://numlims.github.io/).

## update this

to add a new api doc or to update the doc for one of the
programs contained here:

clone this repo and place it in your home as `numlims.github.io` (if
you chose a different name adjust the path in the following steps).

insert this into the `makefile` of your program, if not there already:

```
# point to the doc repo
docdir = ~/numlims.github.io/<myprogram>
docmake = ~/numlims.github.io

doc:
	make
	<doc html generation command>  # e.g. pdoc "./myprogram" -o html

doc-publish:
	make doc
	cp -r html/* ${docdir}
	cd ${docmake} && make publish
```

this adds pointers to this repo, inserts a `doc` section to generate
the html (if not there already) and a `doc-publish` section for
getting the generated html into this repo.

in this repo's `index.html`, add a link to your program's doc folder:

```
<a href="myprogram">my program</a>
```

then, in your program's root you just need to say

```
make doc-publish
```

to get changes from your code updated in the api docs here.

you might have to log into your github account before saying `make
doc-publish`. you can consider adding an automitic log in to github as
the first line of the `publish` section in this repo's `makefile`, see
[gh-login](https://github.com/numlims/limsbin/blob/main/gh-login).