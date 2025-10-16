# numlims.github.io

see [numlims.github.io](https://numlims.github.io/).

## update this

to add a api doc to this repo or to update the api doc for one of the
programs contained here:

clone this repo, github.com/numlims/numlims, place it in your home as
`numlims.github.io` (or adjust the path in the following steps).

in the `makefile` of your program, point to this repo:

```
docdir = ~/numlims.github.io/<program>
docmake = ~/numlims.github.io
```

insert a `doc` section to generate
the html (if not there already):

```
doc:
	make
	<doc html generation command>  # e.g. pdoc "./myprogram" -o html
```

insert a `doc-publish` section for getting the generated html into
this repo.

```
doc-publish:
	make doc
	cp -r html/* ${docdir}
	cd ${docmake} && make publish
```

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