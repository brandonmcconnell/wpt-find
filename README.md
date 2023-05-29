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