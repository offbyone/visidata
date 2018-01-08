- Updated: 2017-12-27
- Version: VisiData 1.0

# Customizing VisiData

## Options

- To declare an option:

```
option('num_burgers', 42, 'number of burgers to use')
```

- To get the value of an option:

```
options.num_burgers or options['num_burgers']
```

- To set the value of an option:

```
options.num_burgers = 13
```

The type of the default is respected, with an `Exception` raised if trying to set with a value that cannot be converted.  (A default value of None will allow any type.)

Option names should use the underscore for word breaks.  On the command-line, underscores must be converted to dashes:

```
$ vd --num-burgers=23
```

The maximum option name length should be 20.

`theme()` should be used instead of `option()` if the option has no effect on the operation of the program, and can be overrided without affecting existing scripts.  The interfaces are identical.  (The implementation is also identical currently, but that may change in the future.)

# Persisting options


The contents of `.visidatarc` in the user's home directory (and also the current directory) are `exec()`d on startup.

This can be used to persistently set any available options (as above):

```
options.num_burgers = 13
```

Command-line options will still override those set in `.visidatarc`.

## Commands

Both `globalCommand` and `Command` take the same parameters:

    Command(keystrokes, execstr, helpstr, longname)

- To create a command alias:

    globalCommand('^D', 'd')
    globalCommand('^D', 'delete-row')

- To define a new command:

    globalCommand('^D', 'sheet.topRowIndex += nVisibleRows//2', 'scroll one half-page down', 'scroll-halfpage-down')

or for sheet-level commands:

    class YourSheet:
        commands=[Command(as above), ...]

or

    ColumnsSheet.commands += [Command(as above), ...]

`execstr` is resolved recursively, so it can be an existing keystroke or `longname` for those that have one.  The last in the chain is exec()ed.

- To override a keybinding:

    globalCommand('^D', 'A', '')

- To disable a keybinding:

    globalCommand('^D', '')

---
