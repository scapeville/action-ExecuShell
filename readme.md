# ExecuShell

GitHub Action: Set all shell (`.sh`) files within a specific directory to be executable.


## Usage

### One time use

```yml
# .github/workflows/execushell.yml

name: ExecuShell

on: workflow_dispatch  # Run manually from 'Actions' tab

jobs:
  run:
    runs-on: ubuntu-latest
    permissions:
      contents: write  # For committing
    steps:
      - uses: scapeville/action-ExecuShell@v1
        with:
          dir: ./                # required
          git-name: your name    # required
          git-email: your@email  # required
          recursive: false       # optional
```

### In-workflow use

> Note: Make sure to know how the action works before going with this one.

```yml
jobs:
  ...:
    runs-on: ubuntu-latest
    permissions:
      contents: write  # For committing
    steps:
      - uses: scapeville/action-ExecuShell@v1
        with:
          dir: ./foo
          git-name: your name
          git-email: your@email
```

### Params

- (required) `dir`: Specify the directory path (relative to the repo root) where shell files will be made executable. Examples: `./` for root shell files; `foo` or `./foo` for shell files in the 'foo' folder.
- (required) `git-name`: Git name for committing.
- (required) `git-email`: Git email for committing.
- (optional) `recursive`: Choose `true` to include shell files in 'dir' and its **subdirectories**, or `false` to include shell files in 'dir' alone. Default is `false`.