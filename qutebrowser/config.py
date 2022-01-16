# Qutebrowser configuration
# Author: tilleyd

# Available from qutebrowser:
# c (shorthand for config.set("", _)
# config

# Load autoconfig first so this file takes priority
config.load_autoconfig()


def alpha(code, color):
    """Adds a 2-char hex alpha code to a color."""
    return f"#{code}{color[1:]}"


# Theme
class theme:
    bg_morelight = "#ffffff"
    bg_light     = "#dcdfe4"
    fg_light     = "#282c34"
    bg_dark      = "#282c34"
    fg_dark      = "#dcdfe4"
    red          = "#e06c75"
    green        = "#98c379"
    yellow       = "#e5c07b"
    blue         = "#61afef"
    magenta      = "#c678dd"
    cyan         = "#56b6c2"


# Fonts
c.fonts.default_family = "Roboto Mono"


# Tabs
c.tabs.padding = {
    "bottom": 5,
    "left": 7,
    "right": 7,
    "top": 5,
}
c.tabs.title.alignment = "left"
c.tabs.title.format = "{audio} {current_title}"
c.tabs.min_width = -1
c.tabs.max_width = 256

c.colors.tabs.bar.bg = theme.bg_dark
c.colors.tabs.even.bg = theme.bg_light
c.colors.tabs.even.fg = theme.fg_light
c.colors.tabs.odd.bg = theme.bg_light
c.colors.tabs.odd.fg = theme.fg_light
c.colors.tabs.selected.even.bg = theme.bg_morelight
c.colors.tabs.selected.even.fg = theme.fg_light
c.colors.tabs.selected.odd.bg = theme.bg_morelight
c.colors.tabs.selected.odd.fg = theme.fg_light
c.colors.tabs.pinned.even.bg = theme.bg_dark
c.colors.tabs.pinned.even.fg = theme.fg_dark
c.colors.tabs.pinned.odd.bg = theme.bg_dark
c.colors.tabs.pinned.odd.fg = theme.fg_dark
c.colors.tabs.pinned.selected.even.bg = c.colors.tabs.selected.even.bg
c.colors.tabs.pinned.selected.even.fg = c.colors.tabs.selected.even.fg
c.colors.tabs.pinned.selected.odd.bg = c.colors.tabs.selected.odd.bg
c.colors.tabs.pinned.selected.odd.fg = c.colors.tabs.selected.odd.fg
c.colors.tabs.indicator.error = theme.red
c.colors.tabs.indicator.start = theme.yellow
c.colors.tabs.indicator.stop = theme.blue


# Hints
c.hints.border = "0px"
c.hints.padding = {
    "bottom": 2,
    "left": 5,
    "right": 5,
    "top": 2,
}
c.hints.radius = 3
c.hints.scatter = False # ?

c.colors.hints.bg = theme.blue
c.colors.hints.fg = theme.fg_light
c.colors.hints.match.fg = theme.fg_dark


# Statusbar
c.statusbar.padding = {
    "bottom": 2,
    "left": 5,
    "right": 5,
    "top": 2,
}
c.statusbar.position = "bottom"
c.statusbar.show = "always"
c.statusbar.widgets = [
    "keypress",
    "progress",
    "history",
    "url",
]
c.messages.timeout = 3000 # [ms]

c.colors.statusbar.normal.bg = theme.bg_dark
c.colors.statusbar.normal.fg = theme.fg_dark
c.colors.statusbar.private.bg = theme.magenta
c.colors.statusbar.private.fg = theme.fg_light
c.colors.statusbar.insert.bg = theme.blue
c.colors.statusbar.insert.fg = theme.fg_light
c.colors.statusbar.passthrough.bg = theme.cyan
c.colors.statusbar.passthrough.fg = theme.fg_light
c.colors.statusbar.caret.bg = theme.yellow
c.colors.statusbar.caret.fg = theme.fg_light
c.colors.statusbar.caret.selection.bg = c.colors.statusbar.caret.bg
c.colors.statusbar.caret.selection.fg = c.colors.statusbar.caret.fg
c.colors.statusbar.command.bg = c.colors.statusbar.normal.bg
c.colors.statusbar.command.fg = c.colors.statusbar.normal.fg
c.colors.statusbar.command.private.bg = c.colors.statusbar.private.bg
c.colors.statusbar.command.private.fg = c.colors.statusbar.private.fg
c.colors.statusbar.progress.bg = theme.red
c.colors.statusbar.url.error.fg = theme.red
c.colors.statusbar.url.fg = theme.fg_dark
c.colors.statusbar.url.hover.fg = theme.blue
c.colors.statusbar.url.success.http.fg = theme.fg_dark
c.colors.statusbar.url.success.https.fg = theme.fg_dark
c.colors.statusbar.url.warn.fg = theme.yellow


# Command completion
c.completion.cmd_history_max_items = 0
c.completion.web_history.max_items = -1
c.completion.height = "25%"
c.completion.timestamp_format = "%Y-%m-%d"
c.completion.scrollbar.padding = 0
c.completion.scrollbar.width = 8
c.completion.shrink = True

c.colors.completion.category.bg = theme.bg_dark
c.colors.completion.category.border.bottom = theme.bg_dark
c.colors.completion.category.border.top = theme.bg_dark
c.colors.completion.category.fg = theme.fg_dark
c.colors.completion.fg = theme.fg_light
c.colors.completion.match.fg = theme.magenta
c.colors.completion.even.bg = theme.bg_light
c.colors.completion.odd.bg = theme.bg_light
c.colors.completion.item.selected.bg = theme.blue
c.colors.completion.item.selected.fg = theme.fg_light
c.colors.completion.item.selected.border.bottom = theme.blue
c.colors.completion.item.selected.border.top = theme.blue
c.colors.completion.item.selected.match.fg = theme.fg_dark
c.colors.completion.scrollbar.bg = theme.bg_light
c.colors.completion.scrollbar.fg = theme.fg_light


# Prompts
c.prompt.radius = 0
c.colors.prompts.border = f"1px solid {theme.fg_light}"
c.colors.prompts.bg = theme.bg_dark
c.colors.prompts.fg = theme.fg_dark
c.colors.prompts.selected.bg = theme.blue
c.colors.prompts.selected.fg = theme.fg_light


# Downloads
c.downloads.position = "bottom"
c.colors.downloads.bar.bg = theme.bg_dark
c.colors.downloads.error.bg = theme.red
c.colors.downloads.error.fg = theme.fg_light
c.colors.downloads.start.bg = theme.yellow
c.colors.downloads.start.fg = theme.fg_light
c.colors.downloads.stop.bg = theme.green
c.colors.downloads.stop.fg = theme.fg_light


# Miscellaneous
c.confirm_quit = ["multiple-tabs", "downloads"]
c.content.autoplay = False
c.scrolling.smooth = True
c.scrolling.bar = "always"
c.tabs.last_close = "close"
