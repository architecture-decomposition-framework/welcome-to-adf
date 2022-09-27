# Documentation-as-code (Architecture Decomposition Framework) <!-- omit in toc -->

![ADF Logo](../commons/adf-logo265x180.png)

## Content <!-- omit in toc -->

- [What is documentation-as-code?](#what-is-documentation-as-code)
- [Why documentation-as-code?](#why-documentation-as-code)
- [Documentation-as-code, generic implementation](#documentation-as-code-generic-implementation)
- [Documentation-as-code, the ADF realization](#documentation-as-code-the-adf-realization)
  - [Step 1 and Step 3](#step-1-and-step-3)
  - [Step 2](#step-2)
  - [Example](#example)
  - [Helpful hints](#helpful-hints)
    - [Use the ADF tool libraries for diagrams.net with the VS Code plugin](#use-the-adf-tool-libraries-for-diagramsnet-with-the-vs-code-plugin)
    - [Working with dark mode](#working-with-dark-mode)
    - [Generating PDF from Markdown](#generating-pdf-from-markdown)
- [Presentation-as-code](#presentation-as-code)
- [Footnote](#footnote)

## What is documentation-as-code?

*Documentation-as-code* means to

1. put your documentation (usually, the architecture documentation) as close as possible to the source code and make sure that it is under version control,
2. choose a format that any developer can edit with low effort, and
3. make up-to-date documentation accessible to everyone (including non-tech-people) in an easily consumable format.

## Why documentation-as-code?

Most developers prefer implementing new features over documenting their architecture. If they are also forced to leave their familiar development environment to deal with stubborn Word templates and documents on VPN-protected network drives, the chances of the documentation matching the current state of development are relatively slim. To have an up-to-date, easily accessible documentation, we need something else than this.

## Documentation-as-code, generic implementation

Usually, the three points from above are addressed in this way.

Step 1: Just create a folder for the documentation in the project repository (e.g. Git repository) which also contains the corresponding source code. If you have multiple repositories for different parts of the software and need to document more than one part at once, an extra repository can be necessary - but be aware that this creates an additional indirection (a mono-repo approach can help here).

Step 2: Choose a plaintext format (with mark up possibilities) like Markdown, AsciiDoc, LaTeX or HTML. Decide which format to use for graphics. Options include vector graphics formats with IDE plugin support like Diagrams.net/Draw.io or Diagram-from-plaintext formats like PlantUML.

Step 3: With every commit, generate a human-friendly rich-text version of the documentation. This can be as simple as the Git server rendering an HTML page from Markdown or Asciidoc, or a more sophisticated process run by the build server that runs LaTeX and publishes PDFs to a shared file system.

## Documentation-as-code, the ADF realization

In this section, we describe our choice of tools and technologies to realize Steps 1 to 3. There are many other possibilities available with more flexible and advanced functions, but we choose one of the most simple solution on purpose, in order to to keep the entry barrier as low as possible.

This tool chain has been successfully used in different student projects even with unexperienced developers after not more than 60 minutes of introduction.

### Step 1 and Step 3

We assume that the source code is in one repository on a Git server that supports Markdown-to-HTML rendering, e.g. GitHub or GitLab. We just create a folder `documentation` with an file `architecture-documentation.md` and the content

```markdown
# Architecture documentation

Hello World!
```

Alternatively, we directly use the [ADF architecture documentation template](https://github.com/architecture-decomposition-framework/adf-documentation-template).

As soon as we commit the changes and push to the server, we get an HTML page with the rendered documentation and can easily distribute it via the link to the repository. Even non-devs can be given roles with limited access (as the Reporter role in GitLab) such that they can browse the documentation.

This also works well with different (feature) branches with a (preliminary) updated version of the docs that can be reviewed by other people.

### Step 2

As the previous section already suggests, we use [Markdown](https://en.wikipedia.org/wiki/Markdown) as plaintext format. We do so since it is the simplest format for generating rich text documents and is widely used in other context (e.g. wikis). There is also a good tool support - almost every IDE supports syntax highlighting and some autocompletion and autoformat functions.

As for diagrams, we use [Diagrams.net (formerly known as draw.io)](https://www.diagrams.net/) since it can save diagrams as SVG and PNG files with the diagram itself embedded. Thus, we can open the SVG (or PNG) file, edit the diagram and it updated the SVG (or PNG) as well as the embedded diagram. Consequently, there is no need of an additional "generate SVG (or PNG) file" step - we can immediately embed the SVG (or PNG) into the markdown file.

Diagrams.net runs without installation in any web browser and can be installed as desktop application, however, we recommend to use one of the (unofficial) IDE plugins to be able to edit the diagrams without leaving the IDE.

If the developers are not already using [Visual Studio Code](https://code.visualstudio.com/) and it is feasible for them to (also) use this IDE, we recommend to use it for Markdown editing, because there are some excellent plugins that facilitate the editing a lot:

- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) lets you autogenerate section numbers and content tables, both features that Markdown unfortunately does not support itself
- [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) makes sure that your documents follow a typical style (like blank lines before and after headings, etc.)
- [Draw.io integration](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio) lets you edit your diagrams directly in the IDE. To add a new one, just create a new file *somename*.drawio.svg (or *somename*.drawio.png) and open it with the plugin. It will always update the generated SVG (or PNG) with your diagram.
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) helps you with the spelling (optionally install support for other languages as well)
- [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode) integrates Marp into VS Code and let's you create simple but effective presentations from nothing more than Markdown. Hence, you can easily copy and paste from your documentation to a presentation.

### Example

[This example documentation](https://github.com/neshanjo/what2eat/blob/with-cache/doc/architecture-documentation.md) is written in Markdown and directly embeds figures made with Diagrams.net.

### Helpful hints

There are some hints from using this approach in practice.

#### Use the ADF tool libraries for diagrams.net with the VS Code plugin

To configure the [ADF tool libraries for diagrams.net](https://github.com/architecture-decomposition-framework/adf-diagramsnet) with the VS Code plugin, you have to download the xml file from the libraries directory to your computer and then configure them in the VS Code settings.json:

```json
  "hediet.vscode-drawio.customLibraries": [
    {
      "file": "c:\\Misc\\adf-diagramsnet\\libraries\\ADF_SW@RT.xml",
      "libName": "ADF SW@RT"
    },
    {
      "file": "c:\\Misc\\adf-diagramsnet\\libraries\\ADF_Env@RT.xml",
      "libName": "ADF Env@RT"
    },
    {
      "file": "c:\\Misc\\adf-diagramsnet\\libraries\\ADF_SW@DT.xml",
      "libName": "ADF SW@DT"
    },
    {
      "file": "c:\\Misc\\adf-diagramsnet\\libraries\\ADF_Env@DT.xml",
      "libName": "ADF Env@DT"
    }
  ]
```

Note that this is an example configuration for a Windows machine. Replace the paths with the correct ones for your computer.

Heads up: If even one of the file does not exist or the configuration has some error, the Diagrams.net plugin won't start at all. So double check everything!

#### Working with dark mode

Developers often use a dark theme for there IDE. This setting is also respected by the Diagrams.net plugin in VS Code which then renders the diagrams different from they look on the Git server (in light mode).

The recommended approach is to use a light theme for the Diagrams.net plugin only by configuring 

```json
  "hediet.vscode-drawio.theme": "Kennedy",
```

in the settings.json of VS Code.

Also, diagrams with transparent background might look unreadable when viewed in dark mode. Therefore make sure, that in every diagram, the background is set to white as demonstrated in [this screenshot](assets/digramsnet_darkmode_fix.png).

#### Generating PDF from Markdown

There are situations where a link to your Git server is not appropriate, e.g. when communicating with external stakeholders. You might want to generate a PDF document instead. There are different approaches with an increasing amount of additional work.

**Solution 1:**

Just print the Git server page from the browser and use the built-in PDF printer (works e.g. with Firefox or Chrome).

For a local (offline) solution, you can use the "Print current document to HTML" in VS Code provided by the Markdown all-in-one plugin, open it in your browser and print it from there.

**Solution 2a:**

Use [Pandoc](https://pandoc.org/) which provides Markdown to PDF conversion. However, this does not work out of the box - you need some additional HTML2PDF converter. The most simple (and smallest) one is [wkhtmltopdf](https://wkhtmltopdf.org/). Furthermore, it is recommended to use some CSS styling to improve the look of the resulting document, e.g. <https://gist.github.com/dashed/6714393> which you can download and put into a file `gh-pandoc.css`.

Assuming that both the `pandoc` and `wkhtml2pdf` command are available in the PATH, you can run

```text
pandoc documentation.md -o documentation.pdf" -f gfm -t html --css "C:\Scripts\gh-pandoc.css" -V papersize=a4 -V margin-left=20mm -V margin-right=20mm -V margin-top=25mm -V margin-bottom=20mm
```

to produce a pdf from a Markdown file in only one command that also can be integrated into build server steps (adapt the path to the CSS accordingly).

The **drawback** of this simple method, however, is that **page breaks** in the PDF **can happen** at places where they don't belong, e.g. **after headings**.

**Solution 2b:**

This solution is similar to the previous but uses [pagedjs-cli](https://pagedjs.org/documentation/2-getting-started-with-paged.js/#command-line-version) for PDF generation, which can be configured to avoid page breaks after headings.

Add this to the CSS file used to style the HTML:

```css
h1, h2, h3, h4, h5, h6 {
  page-break-after: avoid;
}

```

Optionally configure the page layout with this addition CSS code:

```css
/* for pagedjs, see https://pagedjs.org/documentation/5-web-design-for-print/ */
@page {
  size: A4;
  /* These values are based on experimentation to place the text 
     with similar margins on all sides, but a slightly larger margin
     on top */
  margin-top: 20mm;
  margin-bottom: 5mm;
  margin-left: 10mm;
  margin-right: 20mm;
}

```

Assuming that both the `pandoc` and `wkhtml2pdf` command are available in the PATH, , you can finally use this shell script to generate the pdf file (can be run in Git bash in windows), while making sure to adapt the path to the css file:

```bash
#!/bin/sh
currentMillis=$(date +%s%3N)
tempFile="${1%%\.md}-${currentMillis}.html"
pandoc "$1" -o "$tempFile" -f gfm -t html 
pagedjs-cli -i "$tempFile" -o "${1%%\.md}.pdf" --style "C:\Scripts\gh-md.css"
rm -f "${tempFile}"
```

**Solution 2c:**

This solution is similar to the previous solutions but uses LaTeX for PDF generation, which should result into much better formatting quality, but also requires a full LaTeX installation on all machines that are used to generated PDFs. This approach has not been tested by the writer of this guide yet, but detailed instructions can be found on <https://learnbyexample.github.io/customizing-pandoc/>.

## Presentation-as-code

Thanks to [Marp](https://marp.app/), the Markdown Presentation Ecosystem, simple and effective presentations can be easily generated by reusing Markdown code and figures from the documentation.

The What2Eat example project also contains a [Marp example](https://raw.githubusercontent.com/neshanjo/what2eat/with-cache/doc/architecture-presentation.md) that illustrates some of the features in Marp. Note that the [version rendered by GitHub](https://github.com/neshanjo/what2eat/blob/with-cache/doc/architecture-presentation.md) is *not* the resulting presentation. The final presentation is demoed in [this PDF file](https://raw.githubusercontent.com/neshanjo/what2eat/with-cache/doc/architecture-presentation.pdf).

## Footnote

This document was written by Johannes Schneider. You can use all material freely under the [CC BY-SA 4.0 license](https://creativecommons.org/licenses/by-sa/4.0/).
