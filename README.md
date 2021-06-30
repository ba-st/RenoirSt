# RenoirSt

![Logo](assets/logos/128x128.png)

A DSL enabling programmatic cascading style sheet generation for Pharo Smalltalk

[![Unit Tests](https://github.com/ba-st/RenoirSt/actions/workflows/unit-tests.yml/badge.svg)](https://github.com/ba-st/RenoirSt/actions/workflows/unit-tests.yml)
[![Coverage Status](https://codecov.io/github/ba-st/RenoirSt/coverage.svg?branch=release-candidate)](https://codecov.io/gh/ba-st/RenoirSt/branch/release-candidate)
[![Group loading check](https://github.com/ba-st/RenoirSt/actions/workflows/loading-groups.yml/badge.svg)](https://github.com/ba-st/RenoirSt/actions/workflows/loading-groups.yml)
[![Markdown Lint](https://github.com/ba-st/RenoirSt/actions/workflows/markdown-lint.yml/badge.svg)](https://github.com/ba-st/RenoirSt/actions/workflows/markdown-lint.yml)

[![GitHub release](https://img.shields.io/github/release/ba-st/RenoirSt.svg)](https://github.com/ba-st/RenoirSt/releases/latest)
[![Pharo 6.1](https://img.shields.io/badge/Pharo-6.1-informational)](https://pharo.org)
[![Pharo 7.0](https://img.shields.io/badge/Pharo-7.0-informational)](https://pharo.org)
[![Pharo 8.0](https://img.shields.io/badge/Pharo-8.0-informational)](https://pharo.org)

Quick links

- [**Explore the docs**](docs/)
- [Report a defect](https://github.com/ba-st/RenoirSt/issues/new?labels=Type%3A+Defect)
- [Request a feature](https://github.com/ba-st/RenoirSt/issues/new?labels=Type%3A+Feature)

## Goals

- Improve CSS integration with existing Web Frameworks
- Write & refactor in Smalltalk, deploy to CSS

### Benefits

- Keep in sync your code changes with the changes in the CSS
- Use your favorite browsing and refactoring tools inside the same Pharo image
  to handle CSS  

## License

- The code is licensed under [MIT](LICENSE).
- The documentation is licensed under [CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0/).

## Quick Start

- Download the latest [Pharo 32](https://get.pharo.org/) or [64 bits VM](https://get.pharo.org/64/).
- Download a ready to use image from the [release page](https://github.com/ba-st/RenoirSt/releases/latest)
- Explore the [documentation](docs/)

***********************************************

Now you can try the Hello World:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector body before]
  with: [:style | style content: '"Hello World"'];
  build
```

you should see something like this:

```css
body::before
{
  content: "Hello World";
}
```

## Installation

To load the project in a Pharo image, or declare it as a dependency of your own
project follow this [instructions](docs/Installation.md).

## Contributing

Check the [Contribution Guidelines](CONTRIBUTING.md)
