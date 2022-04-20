# How to load RenoirSt in a Pharo image

## Pharo 6.1 or greater

### Using Metacello

1. Download a [Pharo VM and image](https://pharo.org/download)
2. Open your Pharo image
3. Open a Playground
4. Evaluate:

    ```smalltalk
    Metacello new
      baseline: 'RenoirSt';
      repository: 'github://ba-st/RenoirSt:release-candidate';
      load: 'Development'.
    ```

> Change `release-candidate` to some released version if you want a pinned version

### Using Iceberg

1. Download [pharo VM and image](https://pharo.org/download)
2. Open your Pharo image
3. Open Iceberg
4. Click the *Add* repository button
5. Select *Clone from github.com* and enter `ba-st` as owner name and `RenoirSt`
   as project name
6. Click *Ok*
7. Select the repository in the main Iceberg window
8. Open the contextual menu and select
  *Metacello -> Install baseline of RenoirSt ...*
9. Type `Development` and click *Ok*

> After Iceberg cloned a repository, it will be checked-out at the default
> branch (in this case `release-candidate`). If you want to work on a different
> branch or commit, perform the checkout before the baseline installation step.

## Pharo 5

- Open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'RenoirSt';
  repository: 'github://ba-st/RenoirSt:stable-pharo-50/source';
  load
```

or

- Load it using the Catalog Browser

## Pharo 4

- Open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'RenoirSt';
  repository: 'github://ba-st/RenoirSt:stable-pharo-40/source';
  load
```

or

- Load it using the Configuration Browser

## Pharo 3 (this version is stalled at 1.4.0)

- Load it using the Configuration Browser

or

- Open a workspace and evaluate:

```smalltalk
Gofer it    
    url: 'http://smalltalkhub.com/mc/gcotelli/RenoirSt/main';
    configurationOf: 'RenoirSt';
    loadStable
```
