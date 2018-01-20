- Update: 2018-01-20
- Version: VisiData 1.0

# Columns

## How to manipulate columns

Commands(s)     Operation
------------    -----------
`!`             pins the current column on the left as a key column
 `H`  `L`       slides the current column one position to the left/right
`gG` `gL`       slides the current column all the way to the left/right of the sheet

---

## How to hide and unhide columns

######How to hide columns

- Press `-` (hyphen) to hide the current column.

**or**

1. Press `C` on the source sheet to open its columns metasheet.
2. Move the cursor right to the `width` column
3. Move the cursor down to the row which represents the column you wish to hide.
4. Press `e` followed by *0* to set the width for that column to 0.
5. Press `q` to return to the source sheet.

######How to unhide columns

1. Press `C` on the source sheet to open its columns metasheet.
2. Move the cursor right to the `width` column
3. Move the cursor down to the row which represents the column you wish to unhide. Currently, that cell should contain the value `0`.
4. Press `e` followed by a *positive number* to set the width.
5. Press `q` to return to the source sheet.

---

## How to specify column types

Columns usually begin as untyped.

To change the type of a column, use one of the following keystrokes:

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

######How to specify batch specify column types for more than one column

1. Press `C` to open the columns sheet.
2. Press `s` or `t` to select the rows referencing the columns you wish to type.
3. Type `g` followed by the any of the above typing keystrokes to set the type of all selected columns on the source sheet.

---

## How to split a column

Python regular expressions provide more finetuned column splitting. The following example
uses the commands for column splitting and transformation with [xd/puzzles.tsv](http://xd.saul.pw/xd-metadata.zip).

<div class="asciicast">
    <asciinema-player id="player" poster="npt:0:20" rows=27 src="../casts/split-regex.cast"></asciinema-player>
    <script type="text/javascript" src="/asciinema-player.js"></script>
</div>

###

1. `:` adds new columns derived from splitting the current column at positions defined by a regex pattern. The current row will be used to infer the number of columns that will be created.
2. `;` adds new columns derived from pulling the contents of the current column which match the regex within capture groups. This command also requires an example row.
3. `*` followed by 'regex'`/`'substring' replaces the text which matches the capture groups in 'regex' with the contents of 'substring'. 'substring' may include backreferences (`\1` etc).

---

## How to create derivative columns

The `=` command takes a Python expression as input, evaluates the expression, and creates a new column from the result. Column names can be supplied as variables, in order to have the expression performed on the column cell-by-cell. VisiData supports `Tab` autocomplete of column names.

The following example use the file [sample.tsv](https://raw.githubusercontent.com/saulpw/visidata/stable/sample_data/sample.tsv).

**Query** On which days have we sold more than 10 `Item`s?

1. Scroll to the `Unit`s column. Type the `Units` column by pressing `#` (int).
2. Type `=` followed by *Units > 10*. A new column will be created. The cells in this column will contain the value `True` in rows where the number of `Unit`s are greater than 10 and `False` otherwise.
3. Move to the new derived column.
4. Type `|` followed by *True* to select all rows where there were more than 10 `Unit`s sold.
5. Press `"` to open a duplicate sheet with only those selected rows.

**Query** I have a dateset with separate columns for `Year`, `Month and `Day`. How can I concatenate them into a single date column?

1. Type `=` followed by *Year + '-' + Month + '-' + Day*
2. Set the type of the new derived column by pressing `@` (date).

---

## How to modify configuration for multiple columns

Properties of columns on the source sheet can be changed by using [standard editing commands](/howto/editing) on its Columns Sheet (accessed with `C`). In particular, it facilitates the selection of multiple columns, followed by utilising one of the `g`-prefixed commands to modify all of them.

For a full list of available commands, see the [man page](/howto/man#columns). Some example workflows follow.

###### How to set multiple statistical aggregators

The following examples use the file [sample.tsv](https://raw.githubusercontent.com/saulpw/visidata/stable/sample_data/sample.tsv).

**Question** What is the average daily revenue from sales of each `Item`?

1. Press `C` to open the Columns sheet.
2. Move the cursor to the row referencing the source sheet `Units` column.

    a. Type the source sheet `Units` column by pressing `#` (int).
    b. Press `s` or `t` to select it.

3. Move the cursor to the row referencing the source sheet `Total` column.

    a. Type the source sheet `Total` column by pressing `%` (float).
    b. Press `s` or `t` to select it.

4. Type `g+` followed by *avg* to add a `avg` statistical aggregator to the selected rows.
5. Press `q` to exit and return to the source sheet.
6. Scroll to the `Item` column. Press `F` to open the frequency table.

**Question** What are the average daily and total number of `Units` sold for each `Item`?

1. Press `C` to open the Columns sheet.
2. Move the cursor to the row referencing the source sheet `Units` column.

    a. Type the source sheet `Units` columns by pressing `#` (int).
    b. Move the cursor to the `aggregators` column.
    c. Type `e` to enter edit mode, followed by *sum avg*.

3. Press `q` to exit and return to the source sheet.
4. Move the cursor to the `Item` column. Press `F` to open the frequency table.

---
