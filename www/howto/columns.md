- Update: 2018-01-11
- Version: VisiData 1.0

# Columns

## Hiding and moving columns

To manipulate columns in VisiData:

- Press `H` and `L` to slide the current column one position to the left and right.
- Press `gH` and `gL` to slide the current column all the way to the left and right of the sheet.
- Press `!` to pin current column on the left as a key column.

To hide columns in VisiData:

- Press `_` to adjust the width of the current column.
*or*
- Press `g_` to adjust the width of all visible columns.

## How to change column settings (types)

Columns usually begin as untyped.

To type columns use the following keystrokes:

 Command    Type
--------- --------
`~`       anytype
`#`       int
`%`       float
`$`       currency
`@`       date

If you see something odd while working with numerical or datetime data, the issue is usually that the values are being considered as strings and the problem is solved with typing.

The following example uses the file [sample.tsv](https://raw.githubusercontent.com/saulpw/visidata/stable/sample_data/sample.tsv).

<section id="hero">
    <asciinema-player id="player" poster="npt=0:20" rows=27 src="../casts/types.cast"></asciinema-player>
    <script type="text/javascript" src="/asciinema-player.js"></script>
</section>

## How to split columns

---
