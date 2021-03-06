## Contributing

VisiData was written for those of us on the edge, with one foot necessarily in the old world while we gain our footing in the new world.  I am always looking for feedback and contributions to help make the tool more useful and reliable.

### Code contributions

VisiData has two main branches:

- [stable](https://github.com/saulpw/visidata/tree/stable) has the last known good version of VisiData (which should be on pypi).
- [develop](https://github.com/saulpw/visidata/tree/develop) has the most up-to-date version of VisiData (which will eventually be merged to stable).

The code is structured such that addons and loaders are completely separate modules, so the easiest thing to do right now is probably to write a loader for an unsupported data source.
They are pretty straightforward once you get the hang of it, and it is a rare pleasure to be able to spend an hour or two on 30 lines of code and then have everything just work.
The dream is to be able to use VisiData to get an instant look inside any database or file format, any size any place, and using only a terminal.

In addition, the innermost core file, `vdtui.py`, is a single-file stand-alone library that provides a solid framework for building text user interface apps. It is distributed under the MIT open software license, and freely available for inclusion in other projects. If you develop an application using it, I would love to see it!

### Feature requests or enhancements

If you use VisiData, I would love it if you reached out to me to discuss some of your common workflows and needs. This helps me better prioritize which functionality to add. Send me a [screencast](http://asciinema.org), or some sample data along with your desired output.  There is probably a way to tweak VisiData to get the job done even more to your liking.  Feature requests should be made on any of the communication channels listed [here](https://github.com/saulpw/visidata/blob/stable/CONTRIBUTING.md#community). 

### Filing issues or support

Create a GitHub issue if anything doesn't appear to be working right. If you get an unexpected error, please include the full stack trace that you get with `Ctrl-E`. Additionally, it would help me more quickly diagnose the problem if you could attach the saved Commandlog (`Ctrl-D`), which will show the steps that lead to the issue. If you are struggling with learning how to use the tool, or are unsure how something works, please also file an issue or write a comment in any of our [community spaces](https://github.com/saulpw/visidata/blob/stable/CONTRIBUTING.md#community). In addition to wanting to help users get the most out of the tool, this helps us gauge the holes in our documentation.

### Contributing tests

The `tests` folder contains functional tests in the form of `.vd` scripts, each of which records a session of VisiData commands.  These ensure that data processing works consistently and reliably.

`test.sh` (run from the git root) will execute all tests.  The final sheet of each test is saved as .tsv and compared to the respective expected output checked into the `tests/golden` directory.

To run a test manually:

```
       $ bin/vd --play tests/foo.vd --replay-wait 1
    or $ bin/vd -p tests/foo.vd -w 1
```

To build a `.vd` file:

1. Go through all of the steps of the workflow, ending on the sheet with the final result.
2. Press `Shift-D` to view the commandlog.
3. Edit the commandlog to minimize the number of commands.  Cells may be parameterized like `{foo}`, to be specified on the commandline:

```
    $ vd cmdlog.vd --foo=value
```

4. Press `Ctrl-S` to save the commandlog to a `.vd` file.

As a shortcut, `Ctrl-D` will save the current commandlog, by default to the next non-existing 'cmdlog-#.vd'

### Contributing to documentation

If you notice a `globalCommand()` or `Command()` which does not have an entry in the vd manpage, please file an issue. In addition, if something is not clear (and in fact, is confusing) let us know so that we can better improve on the documentation.

If you would like to contribute by building an asciicast, the process is shown at [visidata.org/test/meta](http://visidata.org/test/meta).

If you would like to make changes directly to our mandocs, they are contained in `visidata/man/vd.inc`. Please do not make edits to `visidata/man/vd.1` directly because it is generated by our `mkwww.sh` script.

### Community

If you want to chat about VisiData, learn how to use it to maximum effect, or discuss possibilities in the VisiData multiverse, here is where we can be reached:

- [r/visidata](http://reddit.com/r/visidata) on reddit
- [#visidata](irc://frenode.net/#visidata) on [freenode IRC](https://webchat.freenode.net)
- [saul@visidata.org](mailto:saul@visidata.org) to discuss feature requests and extensions
- [anja@visidata.org](mailto:anja@visidata.org) to discuss documentation, tutorials, and tests

### Contributors

Many thanks to the following people for their support and contributions to VisiData:

- @anjakefala
- @azag0
- @brannerchinese
- @jamesroutley
- @jsvine
- @khughitt
- @repjarms
- @scl17
- @trentgill
- @vbrown608
- @wavexx
- @zormit

