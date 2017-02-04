How to contribute
=================

There's several ways to contribute to the project: reporting bugs, sending feedback, proposing ideas for new features, fixing or adding documentation, promoting the project, or even contributing code changes.

## How to report issues

The issue tracker is this GitHub repository. Please use the labels to categorize the issue. 

## How to contribute code

Remember:
- This project is MIT licensed, so any code contribution must be under the same license.
- This project uses [semantic versioning](http://semver.org/), so keep it in mind when you make backwards-incompatible changes. If some backwards incompatible change is made the major version MUST be increased.
- The source code is hosted in this GitHub repository using the filetree format in the `source` folder. The master branch contains the latest changes, feel free to send pull requests or fork the project. 
- Code contributions without test cases have a lower probability of being merged into the main branch.


- Clone this repository or fork it
- Load the corresponding development version with:
The development version can be loaded in a Pharo 4/5 image evaluating the following code snippet:
```smalltalk
Metacello new
  baseline: 'RenoirSt';
  repository: 'filetree://REPO_LOCATION/source';
  load: 'Development'.
```

or 
```smalltalk
Metacello new
  baseline: 'RenoirSt';
  repository: 'filetree://REPO_LOCATION/source';
  load: 'Development-Seaside-Extensions'.
```
if you want the Seaside extensions, where `REPO_LOCATION` is the location of the cloned repo in the local file system.
- Do the changes and save it from Pharo (don't forget to add some test cases)
- Create a branch, commit using the usual Git tooling and open a Pull Request

## How to contribute documentation

The project documentation is mantained in this GitHub repository in the `docs` folder. To contribute some documentation or improve the existing, feel free to create a branch or fork this repository, make your changes and send a pull request.

Remember the docs are licensed under a CC Attribution-ShareAlike license. 

### Useful References:

- [W3c Css Home](http://www.w3.org/Style/CSS/)
