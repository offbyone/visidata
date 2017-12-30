Updated: 2017-12-30
Version: VisiData 1.0

# Design of VisiData: Commands

- Commands, initiated through keystrokes, are what make anything happen.

### `globalCommand(keystrokes, execstr, helpstr, longname)`

`globalCommand` defines a command that is available in every context.  May be overridden in a user `.visidatarc`, or by the Sheets themselves.

* *keystrokes*: the sequence of keys pressed to trigger the action.

* *execstr*: a string containing valid python code that will be passed to `exec`.

* *helpstr*: help text provided on the help sheet and in the cmdlog.

* *longname*: the full name of the command, `lowercase-hyphen` style

`Sheet.commands` is a list of sheet-specific `Command`s, which are only available on the particular sheet, and may override globalCommands.  `Command` is called identically to `globalCommand`.


- If the `execstr` itself is in the commands mapping, then it is taken as an alias, and resolved recursively. This is how custom keybindings, semantic command remappings, and deprecated commands be done.

### keystrokes

The exact curses names returned by [`curses.keyname`](https://docs.python.org/3.5/library/curses.html#curses.keyname) are used as keystrokes.  For the most part, these are just like `a` `A` `^A`.  Non-ascii keys may be non-standard.

- `keystrokes` includes any prefixes: `gh` `g^S`

- If prefixes are combined, they are sorted:  `gz=`  Permutations of prefixes are not allowed.

### execstr

A string that will be exec()ed when the command is executed.


The context is the 'vdtui' globals() namespace, and the local context is the current sheet.

For vdtui apps, their modules need to call vdtui.addGlobals(globals()) for their functions and globals to be exposed to execstrs.

### helpstr

* included as a column in .vd scripts
* 'the current' 

## Example

For example, VisiData has a builtin command ``Shift-R`` to take a random sample of rows from the current sheet:

    globalCommand('R',
            'vd.push(sheet.copy("_sample")).rows=random.sample(rows, int(input("random population size: ")))',
            'push duplicate sheet with a random sample of <N> rows',
            'sheet-sample-rows')

The `exec` string in this example illustrates the basic interface for commands:

* The global `VisiData` singleton object is available as `vd` in the exec string (`vd()` in non-execstr contexts).

* The `VisiData.push` method pushes a `Sheet` object onto the `sheets`
  stack, making it the currently visible sheet. It returns that same sheet, so
  that a member (in this case, ``rows``) may be conveniently set without using
  a temporary variable.

* The current sheet is available as `sheet`.

* The current sheet is also passed as the locals dict to `exec`, so all `Sheet`
  members and methods can be read and called without referencing `sheet`
  explicitly.  **Note**: due to the implementation of `Sheet.exec_command`,
  setting sheet members requires `sheet` to be passed explicitly. That is,
  when a sheet member variable is on the left-hand-side of an assignment, it must be
  referred to as `sheet.member` or the assignment will not stick.

* The `Sheet.copy` member function takes a string, which is appended to the
  original sheet name to make the new sheet's name.

* `random.sample` is a builtin Python function. The `random` package is
  imported by VisiData (and thus available to all extensions automatically);
  other packages may be imported at the toplevel of any .py extension.

* `input` is equivalent to the Python builtin `input`, which displays a prompt on the status line, and gets a line of input from the user using the line editor.

# General mnemonic aids

- `vim` bindings for basic commands: move, scroll, search/next, delete/yank/paste.

- Ctrl-letter keystrokes are housekeeping commands: refresh/reload, scrolling, canceling, etc.

- Commands that push new sheets use the Shift key.  (Sheet = Shift)

- Old-school Ctrl keys from DOS, nethack: ^S for save, ^P for previous status, ^C for cancel, ^V version

- The `g` prefix generally means 'embiggen' or 'global', while the 'z' prefix generally means 'soften' or 'smallify'.
    - The `g` form acts on selected rows (or all rows if none are selected);
    - the `z` form shrinks the context to the current cell;
    - the `gz` form applies the command to all selected rows but in this column only.

For instance, 'd' deletes the current row, 'gd' deletes all selected rows, 'zd' sets the current cell to None, and 'gzd' sets the current column to None for all selected rows.

### Column Types

The commands to set column types:

 - `!` toggle key column (bang == important)
 - `~` set type to str (tilde looks like a little string)
 - `@` set type to date ('at' a certain datetime)
 - `#` set type to int (number sign)
 - `%` set type to float (percent sign means more fractional than number sign)
 - `$` set type to currency (dollar sign is USD)
 - `^` set column name (points to the header)

Note that these are all symbols on the top shifted row (on US keyboards).

`-` hides a column (sets width to 0), and `\_` toggles the width between `default_col_width` and max width.  Note that these are on the same key (on US keyboards).

