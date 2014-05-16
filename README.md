# Coffee Refactor package [![Build Status](https://travis-ci.org/minodisk/coffee-refactor.svg?branch=master)](https://travis-ci.org/minodisk/coffee-refactor)

Refactor CoffeeScript for [Atom](https://atom.io/).

## Reference Finder

### Highlight references

Highlight all references of the symbol under the cursor.

![capture_reference](https://cloud.githubusercontent.com/assets/514164/2929355/b4fe6d30-d788-11e3-88c3-e65c0046d3fc.gif)

You can toggle whether to enable the function or not in the setting view.

1. Open setting with `Atom > Preferences`.
2. Input 'coffee refactor' to `Filter package` and select 'Coffee Refactor' package.
3. Toggle checkbox named `Highlight Reference`.

### Rename references

Rename all references of the symbol under the cursor.

![capture_rename](https://cloud.githubusercontent.com/assets/514164/2929354/b4e848d4-d788-11e3-99c2-620f406d5e6f.gif)

1. Set cursor to symbol.
2. Start renaming using `ctrl-r`.
3. Type new name.
4. Finish renaming by using `enter` or removing cursor from the focused symbol.

### Supported Symbols

* variable name
* function name
* parameter name
* class name
* for-in value and index
* for-of key and value

## Highlight Compile Error (EXPERIMENTAL)

![capture_error](https://cloud.githubusercontent.com/assets/514164/2936037/568a47d8-d841-11e3-84d4-76ba1a8f69b6.gif)

You can toggle whether to enable the function or not in the setting view.

1. Open setting with `Atom > Preferences`.
2. Input 'coffee refactor' to `Filter package` and select 'Coffee Refactor' package.
3. Toggle checkbox named `Highlight Error`.

## Custom Setting

* Override [keymap](kaymaps/coffee-refactor.cson) with `Atom > Open Your Keymap`.
* Override [stylesheet](stylesheets/coffee-refactor.less) with `Atom > Open Your Stylesheet`.

## See

* [Changelog](CHANGELOG.md)
* [MITLicense](LICENSE.md)
