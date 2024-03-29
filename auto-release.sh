#!/bin/bash
version=$(git tag --sort version:refname | tail -n 1)

major=$(echo $version | cut -d. -f1)
minor=$(echo $version | cut -d. -f2)
patch=$(echo $version | cut -d. -f3)
patch=$((${patch} + 1))

version="${major}.${minor}.${patch}"
git checkout 'develop'
git flow init -d -f
git flow release start "${version}" && git flow release finish "${version}" -m "${version}" -F