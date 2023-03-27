# Generating PDF from Markdown <!-- omit in toc -->

Part of [Documentation-as-code (Architecture Decomposition Framework)](Doc-as-code.md)

## Motivation

There are situations where a link to your Git server is not appropriate, e.g. when communicating with external stakeholders. You might want to generate a PDF document instead. There are different approaches with an increasing amount of additional work.

## Solution 1: HTML printing from a browser (no further installation required)

Just print the Git server page from the browser and use the built-in PDF printer (works e.g. with Firefox or Chrome).

For a local (offline) solution, you can use the "Print current document to HTML" in VS Code provided by the Markdown all-in-one plugin, open it in your browser and print it from there.

There is also a VS code plugin called Markdown PDF which simplifies this step even more, but installs a complete chromium browser inside VS Code.

## Solution 2: Command line script (Pandoc + pagedjs)

A much more preferred solution is a simple command line script that can even be run on a build server for creating updated documentation with every build.

### Installation and usage

We first present the script and a tool installation guide and then explain some details that can be helpful for adapting the script, style or workflow.

Make sure that a linux/unix shell is available. Under Windows, the script has been tested with the Git bash that comes with the installation of Git for Windows.

Install [pandoc](https://pandoc.org/installing.html) - used to convert Markdown to HTML.

Install [CLI version of paged.js](https://pagedjs.org/documentation/2-getting-started-with-paged.js/#command-line-version) - used to convert HTML to PDF.

Test that `pandoc` and `pagedjs-cli` commands are available in the PATH and executable with the shell.

Copy the markdown file you want to convert and the scripts in [md2pdf](md2pdf/) into a common folder.

Run `./md2pdf markdownfile.md` in this folder.

Now, a markdownfile.pdf file should be available with the converted document.

Hint: You can place the script into any folder inside your PATH to run the command from anywhere. However, make sure that the path to the CSS file in the pagedjs-cli style argument is specified as an absolute PATH, e.g. `--style "C:\Scripts\md2pdf.css"`.

### Background information

The script first generated a filename for a temporary html file in the format markdownfile-timestamp.html.

It is signalled to pandoc that the markdown is written as Github flavored markdown (`-t gfm`).

The HTML output from pandoc is very basic. That's why there is the `md2pdf.css` style sheet that adds the GitHub style to the HTML. You can, of course, adapt it to your own preference.

The other important styling is the usage of `page-break-after: avoid;` for the heading, e.g. by

```css
h1, h2, h3, h4, h5, h6 {
  page-break-after: avoid;
}
```

The bottom part of `md2pdf.css` configures the page size and margins. You can adapt it to use [other formats](https://pagedjs.org/documentation/5-web-design-for-print/).

## Other solutions (untested)

You can also use LaTeX for PDF generation, which should result into much better formatting quality, but also requires a full LaTeX installation on all machines that are used to generated PDFs. This approach has not been tested by the writer of this guide yet, but detailed instructions can be found on <https://learnbyexample.github.io/customizing-pandoc/>.

## Footnote

This document was written by Johannes Schneider. You can use all material freely under the [CC BY-SA 4.0 license](https://creativecommons.org/licenses/by-sa/4.0/).
