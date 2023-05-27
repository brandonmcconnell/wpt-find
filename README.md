# wpt-find
A handy shell function for searching wpt.fyi for tests matching a provided search term

# Installation

Either add the `wpt-find` function directly to your shell profile file (either `.bashrc`, `.bash_profile`, or `.zshrc` depending on your setup), or save the script file (`./wpt-find`) somewhere on your local machine and add add it as a source to your shell profile file which runs that shell script.

** Make sure you adjust the `"/wpt"` path in the function to match the path to the `wpt` repo directory on your local machine, or this function will not work.

If you use an alias, it would look something like this:

```bash
source "/path-to-file/wpt-find"
```

If you get a `permission denied` error when attempting to run the file (likely on your first run), you'll need to grant execution permsisions on the file in order to run it.

You can do that by running this command while in the directory that contains `wpt-find.sh`:

```bash
chmod +x wpt-find.sh
```

# Usage

### Plain (no flags)

**Input**

```bash
wpt-find ":dir("
```

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

<br /><br />

### Bulleted list items (`-l` flag)

**Input**

```bash
wpt-find -l ":dir("
```

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

<br /><br />

### Abbreviated links via markdown (`-m` flag)

**Input**

```bash
wpt-find -m ":dir("
```

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

<br /><br />

### Both bulleted list items & abbreviated links via markdown (`-l` and `-m` flags)

**Input**

```bash
# either of the below would work (order-agnostic)
wpt-find -l -m ":dir("
wpt-find -lm ":dir("
```

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