# Pre-commit-hooks

pre-commit hooks for various useful devops tools

Adds to https://github.com/dj-wasabi/pre-commit-hooks, simple pass through of helm-unittest options, not just .

**Table of contents**
<!--TOC-->

- [Pre-commit-hooks](#pre-commit-hooks)
  - [Hooks](#hooks)
  - [Scripts](#scripts)
- [Installation](#installation)
  - [Usage](#usage)

<!--TOC-->

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/sparkleGoat/pre-commit)

## Hooks

This pre-commit-hooks repository contains the following hooks.

| Hook name     | Description |
|---------------|------------|
|helm-unittest|This hook run helm unittest from quintush/helm-unittest|

The hook name can be used with the `.pre-commit-config.yaml` as `id`. See [usage](#usage) for an example.

# Installation

```sh
brew install pre-commit
```

## Prerequisites Documentation

The following needs to be set in order to get hook to work.

Install the HELM Unittests
```sh
helm plugin install https://github.com/quintush/helm-unittest
```

## Usage

Create a file named `.pre-commit-config.yaml` in the repository.

Add something like the following:

```yaml
---
repos:
- repo: https://github.com/sparkleGoat/pre-commit
  rev: v0.0.7
  hooks:
    - id: helm-unittest
      args:
        - "-3 test-service"
```

When the file is added, run the following command to install it:

```s
pre-commit install
```

Now, when you do a `git commit` the hooks are executed. You can manually run the hooks by executing the following command:

```sh
pre-commit run -a
```

