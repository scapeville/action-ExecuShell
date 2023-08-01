# ExecuShell

GitHub Action: Set all shell (`.sh`) files within a specific directory to be executable.


## Usage

### One time use

```yml
# .github/workflows/execushell.yml

name: ExecuShell

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  run:
    runs-on: ubuntu-latest
    steps:
      - uses: scapeville/action-ExecuShell@1.0.0
        with:
          dir: ./dir
          git-name: your name
          git-email: your@email
```

### In-workflow use

> Note: Make sure to know how the action works before going with this option.

```yml
jobs:
  ...:
    runs-on: ubuntu-latest
    steps:
      - uses: scapeville/action-ExecuShell@1.0.0
        with:
          dir: ./dir
          git-name: your name
          git-email: your@email
```