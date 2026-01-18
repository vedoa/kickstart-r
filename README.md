# R Package Kickstart Template

This repository is a kickstart template for creating R packages with optional:

- Example data
- Testing backends: testthat or tinytest
- pkgdown documentation site
- Vignette
- CI backends: GitHub Actions, GitLab CI, or Jenkins
- NEWS file

## Usage

From the directory containing this template:

```
kickstart /path/to/rpkg-template -o mypackage
```

You will be asked a series of questions about:

- Package metadata (name, title, description, author, license)
- Whether to include example data
- Which testing framework to use
- Whether to include pkgdown
- Whether to include a vignette
- Which CI backend to configure

Based on your answers, unnecessary files and directories will be removed automatically.
