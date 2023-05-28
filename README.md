# wpt-find
A handy shell function for searching wpt.fyi for tests matching a provided search term

<details><summary><b>✨ <code>wpt-find</code> video demonstration (click to expand/collapse)</b></summary><br />

https://github.com/brandonmcconnell/wpt-find/assets/5913254/b433159c-d357-46bf-bc37-1c924bb2c813

</details>

**Table of Contents:**

- [wpt-find](#wpt-find)
- [Installation](#installation)
- [Config](#config)
  - [Setting your local `wpt` directory path](#setting-your-local-wpt-directory-path)
  - [Overriding default values](#overriding-default-values)
- [Usage](#usage)
    - [Plain (no flags)](#plain-no-flags)
    - [Bulleted list items (`-l` or `--list` flag)](#bulleted-list-items--l-or---list-flag)
    - [Abbreviated links via markdown (`-m` or `--markdown` flag)](#abbreviated-links-via-markdown--m-or---markdown-flag)
    - [Both bulleted list items \& abbreviated links via markdown (`-l` and `-m` flags)](#both-bulleted-list-items--abbreviated-links-via-markdown--l-and--m-flags)
    - [Automatically copy results to the clipboard (`-c` or `--copy` flag)](#automatically-copy-results-to-the-clipboard--c-or---copy-flag)


# Installation

Either add the `wpt-find` function directly to your shell profile file (either `.bashrc`, `.bash_profile`, or `.zshrc` depending on your setup), or save the script file (`./wpt-find`) somewhere on your local machine and add it as a source to your shell profile file which runs that shell script.

** Make sure you adjust the `"/wpt"` path in the function to match the path to the `wpt` repo directory on your local machine, or this function will not work.

If you use an alias, it would look something like this:

```bash
source "/path-to-file/wpt-find"
```

If you get a `permission denied` error when attempting to run the file (likely on your first run), you'll need to grant execution permissions on the file in order to run it.

You can do that by running this command while in the directory that contains `wpt-find.sh`:

```bash
chmod +x wpt-find.sh
```

# Config

This is the default config included at the top of `wpt-find.sh`:

```bash
# Config - change any of these values to match your preferred setup
local directory="/wpt" # Replace this with your local `wpt` checkout path
local md=0
local list=0
local clipboard=0
local green='\033[0;32m'  # Results text color
local blue='\033[0;34m'  # Results links color (when rendering markdown)
local nc='\033[0m'  # Default text color
```

## Setting your local `wpt` directory path

This script assumes that you have a local copy of the `wpt` repo on your machine located at `/wpt` which may not be the case for you. Make sure to update the local `directory` config variable to match the path on your machine.

** This script searches your local copy of the `wpt` repo, so make sure to pull the latest master version on the `wpt` repo before searching.

## Overriding default values

If you would like to _always_ have one of these flags enabled, you can override its default false value by switching any of the `0` values in the script's config section to a `1`, for any of these flag-related variables: `md`, `list`, or `clipboard`.

For more information on the purpose of each of these flags and how they work, check the [Usage](#usage) section below.

# Usage

### Plain (no flags)

**Input**

```bash
wpt-find ":dir("
```

**Output**

<details><summary><strong>Raw output</strong></summary><br /><pre>
https://wpt.fyi/css/css-scoping/shadow-directionality-002.tentative.html
https://wpt.fyi/css/css-scoping/shadow-directionality-001.tentative.html
https://wpt.fyi/css/selectors/dir-selector-ltr-003.html
https://wpt.fyi/css/selectors/dir-style-03a.html
https://wpt.fyi/css/selectors/dir-selector-auto.html
https://wpt.fyi/css/selectors/dir-style-01a.html
https://wpt.fyi/css/selectors/dir-selector-ltr-002.html
https://wpt.fyi/css/selectors/dir-selector-auto-direction-change-001.html
https://wpt.fyi/css/selectors/dir-style-02a.html
https://wpt.fyi/css/selectors/dir-selector-change-001.html
https://wpt.fyi/css/selectors/dir-style-02b.html
https://wpt.fyi/css/selectors/dir-selector-querySelector.html
https://wpt.fyi/css/selectors/dir-selector-change-002.html
https://wpt.fyi/css/selectors/dir-selector-white-space-001.html
https://wpt.fyi/css/selectors/dir-selector-change-003.html
https://wpt.fyi/css/selectors/dir-style-01b.html
https://wpt.fyi/css/selectors/dir-selector-ltr-001.html
https://wpt.fyi/css/selectors/dir-style-04.html
https://wpt.fyi/css/selectors/dir-style-03b.html
https://wpt.fyi/css/selectors/dir-selector-change-004.html
https://wpt.fyi/css/selectors/dir-selector-rtl-001.html
https://wpt.fyi/css/css-pseudo/dir-pseudo-on-input-element.html
https://wpt.fyi/css/css-pseudo/dir-pseudo-on-bdi-element.html
https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir01.html
https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html
https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir.html
https://wpt.fyi/shadow-dom/directionality-002.tentative.html
</pre></details>

<details><summary><strong>Rendered output</strong> (GitHub markdown)</summary><br />
<a href="https://wpt.fyi/css/css-scoping/shadow-directionality-002.tentative.html">https://wpt.fyi/css/css-scoping/shadow-directionality-002.tentative.html</a><br />
<a href="https://wpt.fyi/css/css-scoping/shadow-directionality-001.tentative.html">https://wpt.fyi/css/css-scoping/shadow-directionality-001.tentative.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-ltr-003.html">https://wpt.fyi/css/selectors/dir-selector-ltr-003.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-03a.html">https://wpt.fyi/css/selectors/dir-style-03a.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-auto.html">https://wpt.fyi/css/selectors/dir-selector-auto.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-01a.html">https://wpt.fyi/css/selectors/dir-style-01a.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-ltr-002.html">https://wpt.fyi/css/selectors/dir-selector-ltr-002.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-auto-direction-change-001.html">https://wpt.fyi/css/selectors/dir-selector-auto-direction-change-001.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-02a.html">https://wpt.fyi/css/selectors/dir-style-02a.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-change-001.html">https://wpt.fyi/css/selectors/dir-selector-change-001.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-02b.html">https://wpt.fyi/css/selectors/dir-style-02b.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-querySelector.html">https://wpt.fyi/css/selectors/dir-selector-querySelector.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-change-002.html">https://wpt.fyi/css/selectors/dir-selector-change-002.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-white-space-001.html">https://wpt.fyi/css/selectors/dir-selector-white-space-001.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-change-003.html">https://wpt.fyi/css/selectors/dir-selector-change-003.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-01b.html">https://wpt.fyi/css/selectors/dir-style-01b.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-ltr-001.html">https://wpt.fyi/css/selectors/dir-selector-ltr-001.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-04.html">https://wpt.fyi/css/selectors/dir-style-04.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-03b.html">https://wpt.fyi/css/selectors/dir-style-03b.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-change-004.html">https://wpt.fyi/css/selectors/dir-selector-change-004.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-rtl-001.html">https://wpt.fyi/css/selectors/dir-selector-rtl-001.html</a><br />
<a href="https://wpt.fyi/css/css-pseudo/dir-pseudo-on-input-element.html">https://wpt.fyi/css/css-pseudo/dir-pseudo-on-input-element.html</a><br />
<a href="https://wpt.fyi/css/css-pseudo/dir-pseudo-on-bdi-element.html">https://wpt.fyi/css/css-pseudo/dir-pseudo-on-bdi-element.html</a><br />
<a href="https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir01.html">https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir01.html</a><br />
<a href="https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html">https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html</a><br />
<a href="https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir.html">https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir.html</a><br />
<a href="https://wpt.fyi/shadow-dom/directionality-002.tentative.html">https://wpt.fyi/shadow-dom/directionality-002.tentative.html</a>
</details>

<br />

### Bulleted list items (`-l` or `--list` flag)

**Input**

```bash
# either of the below would work
wpt-find -l ":dir("
wpt-find --list ":dir("
```

**Output**

<details><summary><strong>Raw output</strong></summary><br /><pre>
- https://wpt.fyi/css/css-scoping/shadow-directionality-002.tentative.html
- https://wpt.fyi/css/css-scoping/shadow-directionality-001.tentative.html
- https://wpt.fyi/css/selectors/dir-selector-ltr-003.html
- https://wpt.fyi/css/selectors/dir-style-03a.html
- https://wpt.fyi/css/selectors/dir-selector-auto.html
- https://wpt.fyi/css/selectors/dir-style-01a.html
- https://wpt.fyi/css/selectors/dir-selector-ltr-002.html
- https://wpt.fyi/css/selectors/dir-selector-auto-direction-change-001.html
- https://wpt.fyi/css/selectors/dir-style-02a.html
- https://wpt.fyi/css/selectors/dir-selector-change-001.html
- https://wpt.fyi/css/selectors/dir-style-02b.html
- https://wpt.fyi/css/selectors/dir-selector-querySelector.html
- https://wpt.fyi/css/selectors/dir-selector-change-002.html
- https://wpt.fyi/css/selectors/dir-selector-white-space-001.html
- https://wpt.fyi/css/selectors/dir-selector-change-003.html
- https://wpt.fyi/css/selectors/dir-style-01b.html
- https://wpt.fyi/css/selectors/dir-selector-ltr-001.html
- https://wpt.fyi/css/selectors/dir-style-04.html
- https://wpt.fyi/css/selectors/dir-style-03b.html
- https://wpt.fyi/css/selectors/dir-selector-change-004.html
- https://wpt.fyi/css/selectors/dir-selector-rtl-001.html
- https://wpt.fyi/css/css-pseudo/dir-pseudo-on-input-element.html
- https://wpt.fyi/css/css-pseudo/dir-pseudo-on-bdi-element.html
- https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir01.html
- https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html
- https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir.html
- https://wpt.fyi/shadow-dom/directionality-002.tentative.html
</pre></details>

<details><summary><strong>Rendered output</strong> (GitHub markdown)</summary><br /><ul>
<li><a href="https://wpt.fyi/css/css-scoping/shadow-directionality-002.tentative.html">https://wpt.fyi/css/css-scoping/shadow-directionality-002.tentative.html</a></li>
<li><a href="https://wpt.fyi/css/css-scoping/shadow-directionality-001.tentative.html">https://wpt.fyi/css/css-scoping/shadow-directionality-001.tentative.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-ltr-003.html">https://wpt.fyi/css/selectors/dir-selector-ltr-003.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-03a.html">https://wpt.fyi/css/selectors/dir-style-03a.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-auto.html">https://wpt.fyi/css/selectors/dir-selector-auto.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-01a.html">https://wpt.fyi/css/selectors/dir-style-01a.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-ltr-002.html">https://wpt.fyi/css/selectors/dir-selector-ltr-002.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-auto-direction-change-001.html">https://wpt.fyi/css/selectors/dir-selector-auto-direction-change-001.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-02a.html">https://wpt.fyi/css/selectors/dir-style-02a.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-change-001.html">https://wpt.fyi/css/selectors/dir-selector-change-001.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-02b.html">https://wpt.fyi/css/selectors/dir-style-02b.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-querySelector.html">https://wpt.fyi/css/selectors/dir-selector-querySelector.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-change-002.html">https://wpt.fyi/css/selectors/dir-selector-change-002.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-white-space-001.html">https://wpt.fyi/css/selectors/dir-selector-white-space-001.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-change-003.html">https://wpt.fyi/css/selectors/dir-selector-change-003.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-01b.html">https://wpt.fyi/css/selectors/dir-style-01b.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-ltr-001.html">https://wpt.fyi/css/selectors/dir-selector-ltr-001.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-04.html">https://wpt.fyi/css/selectors/dir-style-04.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-03b.html">https://wpt.fyi/css/selectors/dir-style-03b.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-change-004.html">https://wpt.fyi/css/selectors/dir-selector-change-004.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-rtl-001.html">https://wpt.fyi/css/selectors/dir-selector-rtl-001.html</a></li>
<li><a href="https://wpt.fyi/css/css-pseudo/dir-pseudo-on-input-element.html">https://wpt.fyi/css/css-pseudo/dir-pseudo-on-input-element.html</a></li>
<li><a href="https://wpt.fyi/css/css-pseudo/dir-pseudo-on-bdi-element.html">https://wpt.fyi/css/css-pseudo/dir-pseudo-on-bdi-element.html</a></li>
<li><a href="https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir01.html">https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir01.html</a></li>
<li><a href="https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html">https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html</a></li>
<li><a href="https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir.html">https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir.html</a></li>
<li><a href="https://wpt.fyi/shadow-dom/directionality-002.tentative.html">https://wpt.fyi/shadow-dom/directionality-002.tentative.html</a></li>
</ul></details>

<br />

### Abbreviated links via markdown (`-m` or `--markdown` flag)

**Input**

```bash
# either of the below would work
wpt-find --markdown ":dir("
wpt-find -m ":dir("
```

**Output**

<details><summary><strong>Raw output</strong></summary><br /><pre>
[/css/css-scoping/shadow-directionality-002.tentative.html](https://wpt.fyi/css/css-scoping/shadow-directionality-002.tentative.html)
[/css/css-scoping/shadow-directionality-001.tentative.html](https://wpt.fyi/css/css-scoping/shadow-directionality-001.tentative.html)
[/css/selectors/dir-selector-ltr-003.html](https://wpt.fyi/css/selectors/dir-selector-ltr-003.html)
[/css/selectors/dir-style-03a.html](https://wpt.fyi/css/selectors/dir-style-03a.html)
[/css/selectors/dir-selector-auto.html](https://wpt.fyi/css/selectors/dir-selector-auto.html)
[/css/selectors/dir-style-01a.html](https://wpt.fyi/css/selectors/dir-style-01a.html)
[/css/selectors/dir-selector-ltr-002.html](https://wpt.fyi/css/selectors/dir-selector-ltr-002.html)
[/css/selectors/dir-selector-auto-direction-change-001.html](https://wpt.fyi/css/selectors/dir-selector-auto-direction-change-001.html)
[/css/selectors/dir-style-02a.html](https://wpt.fyi/css/selectors/dir-style-02a.html)
[/css/selectors/dir-selector-change-001.html](https://wpt.fyi/css/selectors/dir-selector-change-001.html)
[/css/selectors/dir-style-02b.html](https://wpt.fyi/css/selectors/dir-style-02b.html)
[/css/selectors/dir-selector-querySelector.html](https://wpt.fyi/css/selectors/dir-selector-querySelector.html)
[/css/selectors/dir-selector-change-002.html](https://wpt.fyi/css/selectors/dir-selector-change-002.html)
[/css/selectors/dir-selector-white-space-001.html](https://wpt.fyi/css/selectors/dir-selector-white-space-001.html)
[/css/selectors/dir-selector-change-003.html](https://wpt.fyi/css/selectors/dir-selector-change-003.html)
[/css/selectors/dir-style-01b.html](https://wpt.fyi/css/selectors/dir-style-01b.html)
[/css/selectors/dir-selector-ltr-001.html](https://wpt.fyi/css/selectors/dir-selector-ltr-001.html)
[/css/selectors/dir-style-04.html](https://wpt.fyi/css/selectors/dir-style-04.html)
[/css/selectors/dir-style-03b.html](https://wpt.fyi/css/selectors/dir-style-03b.html)
[/css/selectors/dir-selector-change-004.html](https://wpt.fyi/css/selectors/dir-selector-change-004.html)
[/css/selectors/dir-selector-rtl-001.html](https://wpt.fyi/css/selectors/dir-selector-rtl-001.html)
[/css/css-pseudo/dir-pseudo-on-input-element.html](https://wpt.fyi/css/css-pseudo/dir-pseudo-on-input-element.html)
[/css/css-pseudo/dir-pseudo-on-bdi-element.html](https://wpt.fyi/css/css-pseudo/dir-pseudo-on-bdi-element.html)
[/html/semantics/selectors/pseudo-classes/dir01.html](https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir01.html)
[/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html](https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html)
[/html/semantics/selectors/pseudo-classes/dir.html](https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir.html)
[/shadow-dom/directionality-002.tentative.html](https://wpt.fyi/shadow-dom/directionality-002.tentative.html)
</pre></details>

<details><summary><strong>Rendered output</strong> (GitHub markdown)</summary><br />
<a href="https://wpt.fyi/css/css-scoping/shadow-directionality-002.tentative.html)">/css/css-scoping/shadow-directionality-002.tentative.html</a><br />
<a href="https://wpt.fyi/css/css-scoping/shadow-directionality-001.tentative.html)">/css/css-scoping/shadow-directionality-001.tentative.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-ltr-003.html)">/css/selectors/dir-selector-ltr-003.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-03a.html)">/css/selectors/dir-style-03a.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-auto.html)">/css/selectors/dir-selector-auto.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-01a.html)">/css/selectors/dir-style-01a.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-ltr-002.html)">/css/selectors/dir-selector-ltr-002.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-auto-direction-change-001.html)">/css/selectors/dir-selector-auto-direction-change-001.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-02a.html)">/css/selectors/dir-style-02a.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-change-001.html)">/css/selectors/dir-selector-change-001.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-02b.html)">/css/selectors/dir-style-02b.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-querySelector.html)">/css/selectors/dir-selector-querySelector.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-change-002.html)">/css/selectors/dir-selector-change-002.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-white-space-001.html)">/css/selectors/dir-selector-white-space-001.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-change-003.html)">/css/selectors/dir-selector-change-003.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-01b.html)">/css/selectors/dir-style-01b.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-ltr-001.html)">/css/selectors/dir-selector-ltr-001.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-04.html)">/css/selectors/dir-style-04.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-style-03b.html)">/css/selectors/dir-style-03b.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-change-004.html)">/css/selectors/dir-selector-change-004.html</a><br />
<a href="https://wpt.fyi/css/selectors/dir-selector-rtl-001.html)">/css/selectors/dir-selector-rtl-001.html</a><br />
<a href="https://wpt.fyi/css/css-pseudo/dir-pseudo-on-input-element.html)">/css/css-pseudo/dir-pseudo-on-input-element.html</a><br />
<a href="https://wpt.fyi/css/css-pseudo/dir-pseudo-on-bdi-element.html)">/css/css-pseudo/dir-pseudo-on-bdi-element.html</a><br />
<a href="https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir01.html)">/html/semantics/selectors/pseudo-classes/dir01.html</a><br />
<a href="https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html)">/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html</a><br />
<a href="https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir.html)">/html/semantics/selectors/pseudo-classes/dir.html</a><br />
<a href="https://wpt.fyi/shadow-dom/directionality-002.tentative.html)">/shadow-dom/directionality-002.tentative.html</a>
</details>

<br />

### Both bulleted list items & abbreviated links via markdown (`-l` and `-m` flags)

**Input**

```bash
# any of the below would work (flag-order-agnostic)
wpt-find --list --markdown ":dir("
wpt-find -l -m ":dir("
wpt-find -lm ":dir("
```

**Output**

<details><summary><strong>Raw output</strong></summary><br /><pre>
- [/css/css-scoping/shadow-directionality-002.tentative.html](https://wpt.fyi/css/css-scoping/shadow-directionality-002.tentative.html)
- [/css/css-scoping/shadow-directionality-001.tentative.html](https://wpt.fyi/css/css-scoping/shadow-directionality-001.tentative.html)
- [/css/selectors/dir-selector-ltr-003.html](https://wpt.fyi/css/selectors/dir-selector-ltr-003.html)
- [/css/selectors/dir-style-03a.html](https://wpt.fyi/css/selectors/dir-style-03a.html)
- [/css/selectors/dir-selector-auto.html](https://wpt.fyi/css/selectors/dir-selector-auto.html)
- [/css/selectors/dir-style-01a.html](https://wpt.fyi/css/selectors/dir-style-01a.html)
- [/css/selectors/dir-selector-ltr-002.html](https://wpt.fyi/css/selectors/dir-selector-ltr-002.html)
- [/css/selectors/dir-selector-auto-direction-change-001.html](https://wpt.fyi/css/selectors/dir-selector-auto-direction-change-001.html)
- [/css/selectors/dir-style-02a.html](https://wpt.fyi/css/selectors/dir-style-02a.html)
- [/css/selectors/dir-selector-change-001.html](https://wpt.fyi/css/selectors/dir-selector-change-001.html)
- [/css/selectors/dir-style-02b.html](https://wpt.fyi/css/selectors/dir-style-02b.html)
- [/css/selectors/dir-selector-querySelector.html](https://wpt.fyi/css/selectors/dir-selector-querySelector.html)
- [/css/selectors/dir-selector-change-002.html](https://wpt.fyi/css/selectors/dir-selector-change-002.html)
- [/css/selectors/dir-selector-white-space-001.html](https://wpt.fyi/css/selectors/dir-selector-white-space-001.html)
- [/css/selectors/dir-selector-change-003.html](https://wpt.fyi/css/selectors/dir-selector-change-003.html)
- [/css/selectors/dir-style-01b.html](https://wpt.fyi/css/selectors/dir-style-01b.html)
- [/css/selectors/dir-selector-ltr-001.html](https://wpt.fyi/css/selectors/dir-selector-ltr-001.html)
- [/css/selectors/dir-style-04.html](https://wpt.fyi/css/selectors/dir-style-04.html)
- [/css/selectors/dir-style-03b.html](https://wpt.fyi/css/selectors/dir-style-03b.html)
- [/css/selectors/dir-selector-change-004.html](https://wpt.fyi/css/selectors/dir-selector-change-004.html)
- [/css/selectors/dir-selector-rtl-001.html](https://wpt.fyi/css/selectors/dir-selector-rtl-001.html)
- [/css/css-pseudo/dir-pseudo-on-input-element.html](https://wpt.fyi/css/css-pseudo/dir-pseudo-on-input-element.html)
- [/css/css-pseudo/dir-pseudo-on-bdi-element.html](https://wpt.fyi/css/css-pseudo/dir-pseudo-on-bdi-element.html)
- [/html/semantics/selectors/pseudo-classes/dir01.html](https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir01.html)
- [/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html](https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html)
- [/html/semantics/selectors/pseudo-classes/dir.html](https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir.html)
- [/shadow-dom/directionality-002.tentative.html](https://wpt.fyi/shadow-dom/directionality-002.tentative.html)
</pre></details>

<details><summary><strong>Rendered output</strong> (GitHub markdown)</summary><br /><ul>
<li><a href="https://wpt.fyi/css/css-scoping/shadow-directionality-002.tentative.html)">/css/css-scoping/shadow-directionality-002.tentative.html</a></li>
<li><a href="https://wpt.fyi/css/css-scoping/shadow-directionality-001.tentative.html)">/css/css-scoping/shadow-directionality-001.tentative.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-ltr-003.html)">/css/selectors/dir-selector-ltr-003.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-03a.html)">/css/selectors/dir-style-03a.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-auto.html)">/css/selectors/dir-selector-auto.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-01a.html)">/css/selectors/dir-style-01a.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-ltr-002.html)">/css/selectors/dir-selector-ltr-002.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-auto-direction-change-001.html)">/css/selectors/dir-selector-auto-direction-change-001.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-02a.html)">/css/selectors/dir-style-02a.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-change-001.html)">/css/selectors/dir-selector-change-001.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-02b.html)">/css/selectors/dir-style-02b.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-querySelector.html)">/css/selectors/dir-selector-querySelector.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-change-002.html)">/css/selectors/dir-selector-change-002.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-white-space-001.html)">/css/selectors/dir-selector-white-space-001.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-change-003.html)">/css/selectors/dir-selector-change-003.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-01b.html)">/css/selectors/dir-style-01b.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-ltr-001.html)">/css/selectors/dir-selector-ltr-001.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-04.html)">/css/selectors/dir-style-04.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-style-03b.html)">/css/selectors/dir-style-03b.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-change-004.html)">/css/selectors/dir-selector-change-004.html</a></li>
<li><a href="https://wpt.fyi/css/selectors/dir-selector-rtl-001.html)">/css/selectors/dir-selector-rtl-001.html</a></li>
<li><a href="https://wpt.fyi/css/css-pseudo/dir-pseudo-on-input-element.html)">/css/css-pseudo/dir-pseudo-on-input-element.html</a></li>
<li><a href="https://wpt.fyi/css/css-pseudo/dir-pseudo-on-bdi-element.html)">/css/css-pseudo/dir-pseudo-on-bdi-element.html</a></li>
<li><a href="https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir01.html)">/html/semantics/selectors/pseudo-classes/dir01.html</a></li>
<li><a href="https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html)">/html/semantics/selectors/pseudo-classes/dir-html-input-dynamic-text.html</a></li>
<li><a href="https://wpt.fyi/html/semantics/selectors/pseudo-classes/dir.html)">/html/semantics/selectors/pseudo-classes/dir.html</a></li>
<li><a href="https://wpt.fyi/shadow-dom/directionality-002.tentative.html)">/shadow-dom/directionality-002.tentative.html</a></li>
</ul></details>

<br />

### Automatically copy results to the clipboard (`-c` or `--copy` flag)

**Input**

```bash
# either of the below would work
wpt-find -c ":dir("
wpt-find --copy ":dir("
```

**Output**

_(same as [plain example](#plain-no-flags) above)_
