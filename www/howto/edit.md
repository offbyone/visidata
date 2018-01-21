- Update: 2018-01-21
- Version: VisiData 1.0

# Editing Contents

##How to edit cells

For a summary of all editing commands, see the [man page](/man#edit).

For editing cells:

Command         Operation
--------        ----------
 `e`            edits contents of current cell
`ge` *text*     sets contents of current column for selected rows to *text*

While in editing mode, or anytime you are passing input to VisiData (e.g. `=`, `;`), these are some commands which become available:

Command             Operation
--------            ----------
`Enter`  `^C`       accepts/aborts input
`^O`                opens external $EDITOR to edit contents
`^R`                reloads initial value
`^A`  `^E`          moves to beginning/end of line
`Backspace`         deletes previous character
`Up`  `Down`        sets contents to previous/next in history
`Tab` `Shift-Tab`   autocomples input (when available)

---

## How to rename columns

Command     Operation
--------    ----------
  `^`       edits name of current column
 `g^`       sets names of all unnamed visible columns to contents of selected rows (or current row)
 `z^`       sets name of current column to contents of current cell
`gz^`       sets name of current column to combined contents of current column for selected rows

In most cases, `^` is the preferred command. Examples which demo `^` can be seen in [Columns](/howto/columns#derived) and [Group](/howto/group#aggregators).

######How to set the header in an Excel sheet?
For the standard filetypes (e.g. csv, tsv) the loaders assume that the dataset's first row is the header row. The Excel loader does not because an Excel file can have multiple sheets in it with a varying number of header rows.

To set the header in an Excel sheet:

1. Press `s` or `t` to select the rows which represent the header rows.
2. Press `g^` to set the names of the headers to the contents of selected rows.

###### How to rename headers using the Columns sheet

1. Press `C` to open the Columns sheet.
2. Within the `name` column, move the cursor to the row which represents the source sheet.
3. Type `e` and then input the new column name. Press `Enter`.
4. Press `q` to return to the source sheet and see your renamed column.

---
