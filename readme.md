# My Neovim Configuration

Welcome to my **Neovim** configuration, a comprehensive setup that enhances my coding experience and suits my workflow very well. This configuration leverages modern plugins and practices to provide a highly customizable and powerful editor tailored for developers who seek efficiency.

> **Note**: This is my personal Neovim configuration, and you are free to use it as a starting point. However, I highly recommend creating your own setup to best suit your individual workflow and preferences.

## Features

- **Optimized Performance**: Fast and lightweight configuration ensuring smooth operation.
- **Intuitive User Interface**: Enhances the default Neovim UI with better aesthetics and usability.
- **Plugin Management**: Seamlessly integrated plugin manager for easy addition and updating of plugins.
- **LSP Support**: Built-in Language Server Protocol (LSP) configuration for code intelligence (completion, diagnostics, etc.).
- **Code Formatting**: Automatic code formatting and linting for various languages.
- **File Navigation**: Enhanced file navigation and fuzzy finding for quick project traversal.
- **Git Integration**: Built-in Git tools for version control within the editor.
- **Syntax Highlighting**: Advanced syntax highlighting using Treesitter for improved code readability.
- **Custom Keybindings**: Ergonomically designed key mappings for common tasks.
- **Terminal Integration**: Access terminal commands directly within Neovim.
- **Custom Status Bar**: A personalized status bar that displays essential information and improves workflow.
- **Snippet Support**: Integrated snippet management for faster coding.
- **Auto-completion**: Smart and context-aware auto-completion to speed up development.
- **Extensibility**: Easily customizable to fit personal preferences and additional plugins.

> **Note**: This config is constantly being updated. So, you can expect removal and addition of features.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Support](#support)
- [Contributing](#contributing)

## Installation

Right now, Installation process is only available for linux.

```sh
git clone https://github.com/vaproh/nvim ~/.config/nvim
```

## Usage

Usage of some features in this Neovim config.

- CodeRunner

```help
`Space + r` - This keybind runs the code.
`Space + rf` - This Keybind runs the current working file.
`Space + rp` - This Keybind runs the project.
`Space + rc` - This Keybind closes the pane.

```

- Toggle Comment

```help
`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
```

- Telescope

```help

```

- Usage instructions
- Support instructions
- Contributing instructions
- Licence

Feel free to remove any sections that aren't applicable to your project.

## Screenshots

![Screenshot 1](/screenshots/1-screenshot.png)

![Screenshot 2](/screenshots/2-screenshot.png)

![Screenshot 3](/screenshots/3-screenshot.png)

![Screenshot 4](/screenshots/4-screenshot.png)

![Screenshot 5](/screenshots/5-screenshot.png)

## Support

Please [open an issue](https://github.com/fraction/readme-boilerplate/issues/new) for support.

## Contributing

Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and [open a pull request](https://github.com/fraction/readme-boilerplate/compare/).
