iespresso
=========

![Espresso](https://raw.githubusercontent.com/markgollnick/iespresso/master/espresso.png)

It’s like `iexpress.exe` on caffeine!


What is it?
-----------

This repo contains tools for creating more useful [iexpress.exe][] packages:

1. Silently extract all files to the current working directory (SFX-style)
2. Run batch scripts that execute from the current directory instead of %TEMP%

This functionality is not readily available via [iexpress.exe][] itself.

[iexpress.exe]: https://en.wikipedia.org/wiki/IExpress


Usage
-----

1.  Include `iespress.vbs` and `iespress.bat` (along with all your other files)
    in your `iexpress.exe` package or silent installer.

2.  The install line (set in the IExpress Wizard) MUST look like the following:

        cmd.exe /c iespress.bat "..."

3.  *Optional:* Replace `"..."` above with a command to run AFTER extraction.
    The command will be run with the location of the original package's EXE
    file as the current working directory. (Normally, all such commands would
    be run from whatever %TEMP% directory the `iexpress.exe` package saw fit to
    extract itself to. This gives you a little bit more flexibility.)

4.  **Done.** All files in the package (except for the files `iespress.vbs` and
    `iespress.bat`) will be extracted to the current working directory, and
    your installer may be run.


Known Limitations
-----------------

You may wish for your files to be extracted to a subdirectory bearing the same
name as the original package instead of having them expand all willy-nilly to
the current working directory. This functionality may come in a future version
of iespresso, but for now, you’ll just have to hard-package your files in a
folder during the IExpress Wizard if you want your files to be expanded to a
directory level below the original package.


Acknowledgments
---------------

- http://msdn.microsoft.com/en-us/library/ff553615.aspx
- http://stackoverflow.com/questions/13534699/iexpress-extraction-path/13700281#13700281
- http://msdn.microsoft.com/en-us/library/aa394599(v=vs.85).aspx
- User “[Pipo][1]” for the beautiful (and free) [Espresso icon][2]! :-)

[1]: https://openclipart.org/user-detail/pipo
[2]: https://openclipart.org/detail/3741/espresso-by-pipo


License
-------

Boost Software License, Version 1.0: <http://www.boost.org/LICENSE_1_0.txt>
