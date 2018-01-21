- Update: 2018-01-17
- Version: VisiData 1.0

# Loading data

## How to specify a source

In VisiData, [loaders](/howto/loaders) load files of a particular type. The following [sources](/man#loaders) are currently supported.

On default, the file extension determines which loader is used. Unknown filetypes are loaded as `Text sheets`.

~~~
vd sample.tsv
~~~

To enforce usage of a particular loader pass the `-f` flag, along with the name of the loader.

~~~
vd -f sqlite bar.db
ls -l | vd -f fixed
~~~

---

## How to load multiple datasets simultaneously

As desired, multiple files can be passed as inputs.

~~~
vd birdsdiet.tsv surveys.csv sunshinelist.html
~~~

Upon launching, VisiData will display the most recent dataset which was loaded (e.g. sunshinelist.html).

Press `o` and enter a filepath to load additional datasets from within a VisiData session.

To access other loaded or derived sheets:

1. Press `S` to open the `Sheets sheet`.
2. Move the cursor to the row containing the desired sheet.
3. Press `Enter` to jump to the sheet referenced in that current cursor row

---
