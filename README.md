iespresso
=========

It's like `iexpress.exe` on caffeine!


What is it?
-----------

This repo contains tools for creating more useful [iexpress.exe][] packages:

1. Silently extract all files to the current working directory (SFX-style)
2. Run batch scripts that execute from the current directory instead of %TEMP%

This functionality is not readily available via [iexpress.exe][] itself.

[iexpress.exe]: https://en.wikipedia.org/wiki/IExpress


Usage
-----

1. Include pexec.vbs (the "parent executable" locator) and pcopy.bat (the
   "persistent copy" script, since iexpress files are temporary and will be
   deleted after install) along with your other files in the iexpress package.
2. The install line (set in IExpress Wizard) MUST be "cmd.exe /c pcopy.bat ..."
3. Optional: Replace "..." above with a command to run AFTER extraction. The
   command or script will be run with the location the package was executed in
   as the current working directory. Alternatively, don't specify anything
   after pcopy.bat to silently extract everything to the current directory.
4. Done. All files in the package (except for pexec.vbs and pcopy.bat) will be
   extracted to the current working directory, and your installer may be run.


Acknowledgments
---------------

- http://msdn.microsoft.com/en-us/library/ff553615.aspx
- http://stackoverflow.com/questions/13534699/iexpress-extraction-path/13700281#13700281
- http://msdn.microsoft.com/en-us/library/aa394599(v=vs.85).aspx
