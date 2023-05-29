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
    - [Regex Search (`-r` or `--regex` flag)](#regex-search--r-or---regex-flag)
    - [Automatically copy results to the clipboard (`-c` or `--copy` flag)](#automatically-copy-results-to-the-clipboard--c-or---copy-flag)
    - [Mixing flags](#mixing-flags)


# Installation

Add the `wpt-find` source directly to your shell profile file (either `.bashrc`, `.bash_profile`, or `.zshrc` depending on your setup). It will look something like this:

```bash
export WPT_FIND_DIRECTORY="$HOME/wpt"
source "$HOME/wpt-find/wpt-find.sh"
```

If you get a `permission denied` error when attempting to run the file (likely on your first run), you'll need to grant execution permissions on the file in order to run it.

You can do that by running this command while in the directory that contains `wpt-find.sh`:

```bash
chmod +x wpt-find.sh
```

# Config

## Setting your local `wpt` directory path

This script assumes that you have a local copy of the `wpt` repo on your machine located at `/wpt` which may not be the case for you. You can set the environment variable `WPT_FIND_DIRECTORY` to your local `wpt` directory path.

```bash
export WPT_FIND_DIRECTORY="/your/path/to/wpt"
```

** This script searches your local copy of the `wpt` repo, so make sure to pull the latest master version on the `wpt` repo before searching.

## Overriding default values

The script also provides several environment variables that you can set to customize its behavior:

- `WPT_FIND_MD`: Set to `1` to enable markdown output by default.
- `WPT_FIND_LIST`: Set to `1` to enable list output by default.
- `WPT_FIND_TITLE`: Set to `1` to include the title in the markdown link by default.
- `WPT_FIND_REGEX`: Set to `1` to use regex for the search by default.
- `WPT_FIND_CLIPBOARD`: Set to `1` to enable copying to the clipboard by default.

By default, all of these settings are set to `0` (disabled) and can be enabled as needed using flags (outlined below), or you can use these environment variables above to override the default behavior.

For more information on the purpose of each of these flags and how they work, check the [Usage](#usage) section below.

# Usage

### Plain (no flags)

```bash
wpt-find ":dir("
```

### Bulleted list items (`-l` or `--list` flag)

```bash
# either of the below would work
wpt-find -l ":dir("
wpt-find --list ":dir("
```

### Abbreviated links via markdown (`-m` or `--markdown` flag)

```bash
# either of the below would work
wpt-find --markdown ":dir("
wpt-find -m ":dir("
```

### Regex Search (`-r` or `--regex` flag)

```bash
# either of the below would work
wpt-find -r "(:is|:where)"
wpt-find --regex "(:is|:where)"
```

### Automatically copy results to the clipboard (`-c` or `--copy` flag)

```bash
# either of the below would work
wpt-find -c ":dir("
wpt-find --copy ":dir("
```

### Mixing flags

```bash
# any of the below would work (flag-order-agnostic)
wpt-find --list --markdown --title --copy ":dir("
wpt-find -l -m -t -c ":dir("
wpt-find -lmtc ":dir("
```
