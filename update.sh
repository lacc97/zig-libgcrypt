#!/bin/sh

git_clone_rev() {
    repo=$1
    rev=$2
    dir=$3

    rm -rf "$dir"
    mkdir "$dir"
    pushd "$dir"
    git init -q
    git fetch "$repo" "$rev" --depth 1
    git checkout -q FETCH_HEAD
    popd
}

GIT_COMMIT=libgcrypt-1.11.0

dep_path=$(dirname "${0}")
dep_path=$(realpath "${dep_path}")
pushd "${dep_path}"

rm -rf upstream/
mkdir upstream
git_clone_rev https://dev.gnupg.org/source/libgcrypt.git $GIT_COMMIT _upstream
mv _upstream/{cipher,compat,mpi,src} upstream/
rm -rf _upstream
