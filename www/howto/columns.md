- Update: 2018-01-11
- Version: VisiData 1.0

# Columns

## How to hide and move columns

To manipulate columns in VisiData:

- Press `H` and `L` to slide the current column one position to the left and right.
- Press `gH` and `gL` to slide the current column all the way to the left and right of the sheet.

- Press `!` to pin current column on the left as a key column.

To hide columns in VisiData:

- Press `_` to adjust the width of the current column.
*or*
- Press `g_` to adjust the width of all visible columns.

## How to change column types

Columns usually begin as untyped.

To change the type of a column, use the following keystroke:

 Command    Type
--------- --------
`~`       string
`#`       int
`%`       float
`$`       currency
`@`       date

Odd results while working with numerical or datetime data is usually due to values being considered as strings, and the problem is solved by setting the correct type.

The following example uses the file [sample.tsv](https://raw.githubusercontent.com/saulpw/visidata/stable/sample_data/sample.tsv).

<div class="asciicast">
    <asciinema-player id="player" poster="npt:0:20" rows=27 src="../casts/types.cast"></asciinema-player>
    <script type="text/javascript" src="/asciinema-player.js"></script>
</div>

## How to split a column

Python regular expressions provide more finetuned column splitting. The following example
uses the commands for column splitting and transformation with [xd/puzzles.tsv](http://xd.saul.pw/xd-metadata.zip).

<div class="asciicast">
    <asciinema-player id="player" poster="npt=0:20" rows=27 src="../casts/split-regex.cast"></asciinema-player>
    <script type="text/javascript" src="/asciinema-player.js"></script>
</div>

###

1. `:` adds new columns derived from splitting the current column at positions defined by a regex pattern. The current row will be used to infer the number of columns that will be created.
2. `;` adds new columns derived from pulling the contents of the current column which match the regex within capture groups. This command also requires an example row.
3. `*` followed by 'regex'`/`'substring' replaces the text which matches the capture groups in 'regex' with the contents of 'substring'. 'substring' may include backreferences (`\1` etc).

---
