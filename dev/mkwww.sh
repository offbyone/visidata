#!/bin/zsh

# Stop the execution of a script if there is an error
set -e

# Set up variables
VD=~/git/visidata
DEV=$VD/dev
WWW=$VD/www
BUILD=$VD/_build
BUILDWWW=$BUILD/www
MAN=$VD/visidata/man
DOCS=$WWW/docs
HOWTO=$WWW/howto

# Build directories
mkdir -p $BUILD
mkdir -p $BUILDWWW
mkdir -p $BUILDWWW/man
mkdir -p $BUILDWWW/docs
mkdir -p $BUILDWWW/about
mkdir -p $BUILDWWW/history
mkdir -p $BUILDWWW/howto
mkdir -p $BUILDWWW/contributing

# Set up python and shell environment
export PYTHONPATH=$VD:$VD/visidata
export PATH=$VD/bin:$PATH

### Build manpage
cp $MAN/* $BUILD/
$MAN/parse_options.py $BUILD/vd-cli.inc $BUILD/vd-opts.inc

soelim -rt -I $BUILD $BUILD/vd.inc > $BUILD/vd-pre.1
preconv -r -e utf8 $BUILD/vd-pre.1 > $MAN/vd.1   # checked in

# build front page of visidata.org
#$DEV/strformat.py body=$WWW/frontpage-body.html title="VisiData" head='' < $WWW/template.html > $BUILDWWW/index.html
for i in 404.html robots.txt main.css ; do
    cp $WWW/$i $BUILDWWW/
done

# Build /
pandoc -r markdown -w html -o $BUILDWWW/index.body $WWW/index.md
$DEV/strformat.py body=$BUILDWWW/index.body title="VisiData" head="" < $WWW/template.html > $BUILDWWW/index.html

# Build /about
pandoc -r markdown -w html -o $BUILDWWW/about/index.body $WWW/about.md
$DEV/strformat.py body=$BUILDWWW/about/index.body title="About VisiData" head="" < $WWW/template.html > $BUILDWWW/about/index.html

# Build /man
echo '<section><pre id="manpage">' > $BUILD/vd-man-inc.html
# <pre> max-width in main.css should be half of COLUMNS=###
MAN_KEEP_FORMATTING=1 COLUMNS=120 man $MAN/vd.1 | ul | aha --no-header >> $BUILD/vd-man-inc.html
echo '</pre></section>' >> $BUILD/vd-man-inc.html
#  Properties of columns on the source sheet can be changed with standard editing commands (e
$DEV/strformat.py body=$BUILD/vd-man-inc.html title="VisiData Quick Reference" head="" < $WWW/template.html > $BUILDWWW/man/index.html

# Create http://visidata.org/man/#loaders
sed -i -e "s#<span style=\"font-weight:bold;\">SUPPORTED</span> <span style=\"font-weight:bold;\">SOURCES</span>#<span style=\"font-weight-:bold;\"><a name=\"loaders\">SUPPORTED SOURCES</a></span>#g" $BUILDWWW/man/index.html

# Build /contributing
pandoc -r markdown -w html -o $BUILDWWW/contributing/index.body $VD/CONTRIBUTING.md
$DEV/strformat.py body=$BUILDWWW/contributing/index.body title="Contributing to VisiData" head="" < $WWW/template.html > $BUILDWWW/contributing/index.html

# build /docs index
pandoc -r markdown -w html -o $BUILDWWW/docs/index.body $WWW/docs.md
$DEV/strformat.py body=$BUILDWWW/docs/index.body title="VisiData documentation" head="" < $WWW/template.html > $BUILDWWW/docs/index.html
rm -f $BUILDWWW/docs/index.body

# Build /docs/*
for postpath in `find $DOCS -name '*.md'`; do
    post=${postpath##$DOCS/}
    postname=${post%.md}
    mkdir -p $BUILDWWW/docs/$postname
    posthtml=$BUILDWWW/docs/$postname/index
    pandoc -r markdown -w html -o $posthtml.body $postpath
    $DEV/strformat.py body=$posthtml.body title=$postname head="" < $WWW/template.html > $posthtml.html
    rm -f $posthtml.body
done

# Build /howto
for postpath in `find $HOWTO -name '*.md'`; do
    post=${postpath##$HOWTO/}
    postname=${post%.md}
    mkdir -p $BUILDWWW/howto/dev/$postname
    posthtml=$BUILDWWW/howto/dev/$postname/index
    pandoc -r markdown -w html -o $posthtml.body $postpath
    $DEV/strformat.py body=$posthtml.body title=$postname head="" < $WWW/template.html > $posthtml.html
    rm -f $posthtml.body
done

# Build /history
pandoc -r markdown -w html -o $BUILDWWW/history/index.body $WWW/history.md
$DEV/strformat.py body=$BUILDWWW/history/index.body title="VisiData documentation" head="" < $WWW/template.html > $BUILDWWW/history/index.html
rm -f $BUILDWWW/history/index.body

# Add other toplevel static files
for fn in devotees.gpg.key vdlogo.png ; do
    cp $WWW/$fn $BUILDWWW/
done

#### At the end
# add analytics to .html files
for fn in `find $BUILDWWW -name '*.html'` ; do
    sed -i -e "/<head>/I{r $VD/www/analytics.thtml" -e 'd}' $fn
done

