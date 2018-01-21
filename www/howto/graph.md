- Update: 2018-01-17
- Version: VisiData 1.0

# Drawing graphs

Graphs in VisiData can be used to visualise the relationship between numeric dependent variables vs a numeric independent variable. Optionally, a second independent variable, which is categorical,  adds an additional colored scatter plot for each category.

This example uses the file [StatusPR.csv](https://raw.githubusercontent.com/saulpw/visidata/stable/sample_data/StatusPR.csv).

<section id="hero">
    <asciinema-player id="player" poster="npt:0:30" rows=27 src="../casts/pivot-graphs.cast"></asciinema-player>
    <script type="text/javascript" src="/asciinema-player.js"></script>
</section>

---


## How to graph a single column

1. Press `!` to set a column as the x-axis. This column must be numeric.
2. Set that column to a numeric type by pressing `#` (int), `%` (float), `$` (currency), or `@` (date).
3. (optional) Press `!` on a categorical key column to add it as an additional independent variable.
4. Type the column you wish to set as the dependent variable with a numeric type.
5. Press `.` (dot=plot) on that column.

---

## How to graph multiple columns

1. Press `!` to set a column as the x-axis. This column must be numeric.
2. Set that column to a numeric type.
3. (optional) Press `!` on a categorical key column to add it as an additional independent variable.
4. Type all of the columns you wish to set as the dependent variables with a numeric type.
5. Press `-` (dash) to hide any numeric columns you don't wish graphed.
6. Press `g.`.

---

##How to interact with graphs

With the keyboard:

- Use `1` - `9` to toggle display of each scatterplot layer.
- Use `h`, `j`, `k`, or `l` to move the cursor.
- Use `H`, `J`, `K`, or `L` to expand and shrink the cursor
- `+`/`-` increases/decreases the zoomlevel, centered on the cursor.
- `zz` zooms into the cursor.
- `_` (underscore) zooms to fit the full extent.
- `s`/`t`/`u` selects/toggles/unselects rows on the source sheet which are contained within the canvas cursor.
- `gs`/`gt`/`gu` selects/toggles/unselects rows visible on the screen.
- `Enter` opens sheet of source rows which are contained within the canvas cursor.
- `gEnter` opens sheet of source rows which are visible on screen.
- Press `w` to toggle the visibility of graph labels.

With the mouse:

- Left-click and drag to set the cursor.
- Right-click and drag to scroll.
- Scroll-wheel to zoom in/out.

---
