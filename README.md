ZoomWinTab
==========

ZoomWinTab is a simple plugin to zoom windows using tabs. Inspired by the [ZoomWin][] plugin.

[ZoomWin]: http://www.vim.org/scripts/script.php?script_id=508

Commands
--------

| Command             | Description                 |
|:--------------------|:----------------------------|
| `:ZoomWinTabIn`     | Zoom in the current window  |
| `:ZoomWinTabOut`    | Zoom out the current window |
| `:ZoomWinTabToggle` | Toggle zoom in and zoom out |

Functions
---------

| Function             | Description                  |
|:---------------------|:-----------------------------|
| `ZoomWinTabIn()`     | Zoom in the current window   |
| `ZoomWinTabOut()`    | Zoom out the current window  |
| `ZoomWinTabToggle()` | Toggle zoom in and zoom out  |

Options
-------

| Option                   | Default  | Description                                  |
|:-------------------------|:---------|:---------------------------------------------|
| `g:ZoomWinTabHideTabBar` | `1`      | If enabled, hides the tab bar when zoomed in |
