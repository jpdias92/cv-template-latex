<h1>Troubleshooting</h1>

- [LaTeX Error: File `ragged2e.sty' not found.](#latex-error-file-ragged2esty-not-found)

# LaTeX Error: File `ragged2e.sty' not found.

While compiling the LaTeX source inside the Docker container, got the following error log:

```
! LaTeX Error: File `ragged2e.sty' not found.

Rule 'pdflatex': The following rules & subrules became out-of-date:

      'pdflatex'
------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'lualatex  -interaction=batchmode -recorder  "template.tex"'
------------
Latexmk: applying rule 'pdflatex'...
This is LuaTeX, Version 1.10.0 (TeX Live 2019)
 restricted system commands enabled.

luaotfload | main : initialization completed in 0.310 seconds
Latexmk: Missing input file: 'ragged2e.sty' from line
  '! LaTeX Error: File `ragged2e.sty' not found.'
Failure to make 'template.pdf'
Collected error summary (may duplicate other messages):
  pdflatex: Command for 'pdflatex' gave return code 1
      Refer to 'template.log' for details
```

The cause of this kind of error is usually related to a missing package in the Docker image

To test installing the missing package, add a new install layer (line) to the Dockerfile:

<pre>
...

RUN tlmgr install luaotfload
RUN tlmgr install pgf textpos etoolbox ifmtarg forloop marvosym parskip enumitem smartdiagram xstring biblatex logreq biblatex-ieee
<b>RUN tlmgr install ragged2e</b>
VOLUME ["/data"]
</pre>

Build the new docker image and use it to compile the LaTeX source. It should either work or complain about a different missing package.