# numlims.github.io

this repo contains the api docs on [numlims.github.io](https://numlims.github.io/).

## update this

to update the doc for one of the programs contained here or to add doc
for a new program:

clone this repo and place it in your home as `numlims.github.io` (if
you chose a different name adjust the path in the following steps).

insert the following lines into the `makefile` of your program and
fill in `<myprogram>` and `<doc html generation command>`.

```
# point to the doc repo
docdir = ~/numlims.github.io/<myprogram>
docmake = ~/numlims.github.io

doc:
	make
	<doc html generation command>  # e.g. pdoc "./myprogram" -o html

doc-publish:
	make doc
        mkdir -p ${docdir}
	cp -r html/* ${docdir}
	cd ${docmake} && make publish
```

the `doc:` section generates the html and the `doc-publish:` gets the
generated html into this repo.

if it's a new program, update this repo's [`index.html`](./index.html):

```
<a href="myprogram">my program</a><br>
```

then, in your program's root you just need to say

```
make doc-publish
```

to get changes from your code updated in the api docs on
[numlims.github.io](https://numlims.github.io/).

you might have to log into your github account before saying `make
doc-publish`. for a gh login script see
[gh-login](https://github.com/numlims/limsbin/blob/main/gh-login).