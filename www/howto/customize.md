- Date: 2017-12-27
- Version: 1.0

# Customizing VisiData

## .visidatarc

## Options

To declare an option:

```
option('num_burgers', 42, 'number of burgers to use')
```

To get the value of an option:

```
options.num_burgers or options['num_burgers']
```

To set the value of an option:

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

## Commands

### How to create a command alias

    globalCommand('^D', 'd')
    globalCommand('^D', 'delete-row')

### How to define a new command

    globalCommand('^D', 'sheet.topRowIndex += nVisibleRows//2', 'scroll half-page')

- or class YourSheet: commands=[Command(as above), ...] for sheet-level commands

- execstr are resolved recursively, so they can be an existing keystroke or "base name" for those that have one.  The last in the chain is exec()ed.

- put in .visidatarc (which is exec()ed Python also)

# How to override a keybinding

- globalCommand('^D', 'A', '')

# How to disable a keybinding

- globalCommand('^D', '')

---

