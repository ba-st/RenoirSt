# Installation

## Basic Installation

### Pharo 6.1 or greater

You can load **RenoirSt** evaluating:

```smalltalk
Metacello new
  baseline: 'RenoirSt';
  repository: 'github://ba-st/RenoirSt:release-candidate/source';
  load.
```

> Change `release-candidate` to some released version if you want a pinned version

or if you want to use the Seaside extensions:

```smalltalk
Metacello new
  baseline: 'RenoirSt';
  repository: 'github://ba-st/RenoirSt:release-candidate/source';
  load: 'Deployment-Seaside-Extensions'.
```

### Pharo 5

- Open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'RenoirSt';
  repository: 'github://ba-st/RenoirSt:stable-pharo-50/source';
  load
```

or

- Load it using the Catalog Browser

### Pharo 4

- Open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'RenoirSt';
  repository: 'github://ba-st/RenoirSt:stable-pharo-40/source';
  load
```

or

- Load it using the Configuration Browser

### Pharo 3 (this version is stalled at 1.4.0)

- Load it using the Configuration Browser

or

- Open a workspace and evaluate:

```smalltalk
Gofer it    
    url: 'http://smalltalkhub.com/mc/gcotelli/RenoirSt/main';
    configurationOf: 'RenoirSt';
    loadStable
```

## Using as dependency

In order to include **RenoirSt** as part of your project, you should reference
the package in your product baseline:

```smalltalk
setUpDependencies: spec

  spec
    baseline: 'RenoirSt'
      with: [ spec
        repository: 'github://ba-st/RenoirSt:v{XX}/source';
        loads: #('Deployment') ];
    import: 'RenoirSt'.
```

> Replace `{XX}` with the version you want to depend on

```smalltalk
baseline: spec

  <baseline>
  spec
    for: #common
    do: [ self setUpDependencies: spec.
      spec package: 'My-Package' with: [ spec requires: #('RenoirSt') ] ]
```

## Provided groups

- `Deployment` will load all the packages needed in a deployed application
- `Tests` will load the test cases
- `Tools` will load the extensions to the SUnit framework and development tools
  (inspector and spotter extensions)
- `CI` is the group loaded in the continuous integration setup
- `Development` will load all the needed packages to develop and contribute to
  the project
- `Deployment-Seaside-Extensions` will load all the packages needed in a deployed
  application including the Javascript extensions
- `Development-Seaside-Extensions` will load all the needed packages to develop
  and contribute to the project including the Javascript extensions
