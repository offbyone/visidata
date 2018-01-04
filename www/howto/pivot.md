# Creating a pivot table

This example uses the file [sample.tsv](https://raw.githubusercontent.com/saulpw/visidata/stable/sample_data/sample.tsv).

<section id="hero">
    <asciinema-player id="player" poster="npt:0:10" rows=27 src="../casts/pivot.cast"></asciinema-player>
    <script type="text/javascript" src="/asciinema-player.js"></script>
</section>

To create a pivot table in VisiData:

1. Press `!` to set the independent variable as a key column.
2. Press `+` to add an aggregrate to a second column. This configures which column is to be composed in relation to others. 
3. (optional) Type the column being aggregated by pressing `~` (string), `#` (int), `%` (float), `$` (currency), or `@` (date).
4. Press `W` to pivot on the dependent categorical variable.
