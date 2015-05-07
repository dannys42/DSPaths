# DSPaths

[![CI Status](http://img.shields.io/travis/dannys42/DSPaths.svg?style=flat)](https://travis-ci.org/dannys42/DSPaths)
[![Version](https://img.shields.io/cocoapods/v/DSPaths.svg?style=flat)](http://cocoapods.org/pods/DSPaths)
[![License](https://img.shields.io/cocoapods/l/DSPaths.svg?style=flat)](http://cocoapods.org/pods/DSPaths)
[![Platform](https://img.shields.io/cocoapods/p/DSPaths.svg?style=flat)](http://cocoapods.org/pods/DSPaths)

## Overview

DSPaths is a simple path substitution library for iOS.  If you need to store
paths to files in your data store (e.g. Core Data), you can't use absolute
paths.  This library provides a simple translation from standard iOS paths to
templated paths that can be expanded.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DSPaths is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DSPaths"
```

## Code Contribution Guidelines

Contributions are welcome!  To make it easy, please follow these steps:
* Fork the project and makr your changes.  We encourage pull requests to discuss code changes.
* When you're ready to create a pull request, be sure to:
    * Have test cases for new code.
    * Squash your commits into a single commit.  `git rebase -i`.  It's okay to force update your pull request.
    * This [blog article](http://chris.beams.io/posts/git-commit/) is a good resource for learning how to write good commit messages, the most important part being that each commit message should have a title/subject in imperative mode without trailing period: *"Return error on wrong use of the Paginator"*, **NOT** *"Returning some error."* Also, if your commit references one or more GitHub issues, always end your commit message body with *See #1234* or *Fixes #1234*. Replace *1234* with the GitHub issue ID. The last example will close the issue when the commit is merged into *master*.


## Author

Danny Sung, danny@dannysung.com

## License

DSPaths is available under the MIT license. See the LICENSE file for more info.
