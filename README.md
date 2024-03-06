# Salesforce CLI Tools

A collection of bash scripts for my daily work with Salesforce. The scripts are basically wrappers around the `sf` cli tool from Salesforce.

**Disclaimer**: These scripts were created to fit my personal needs. They might not fit your needs, they might not work on your machine, they might not work with your project setup.

## Install

Set symlinks to `~/bin/` folder:

    make

Alternatively symlink to custom folders like this example:

    make BINDIR=/usr/local/bin/ COMPLETIONSDIR=/etc/bash_completions.d

## Dependencies

The tools depend on the following non-standard CLI tools:

* [sf](https://github.com/salesforcecli/cli): `npm install -g @salesforce/cli`
* [jq](https://jqlang.github.io/jq): `brew install jq`
* [VisiData](https://www.visidata.org): `brew install saulpw/vd/visidata`
* [daff](https://paulfitz.github.io/daff): `npm install -g daff`
* [csvtk](https://bioinf.shenwei.me/csvtk): `brew install csvtk`
* [graph-easy](https://metacpan.org/release/TELS/Graph-Easy-0.64): `brew install cpanminus; cpan Graph::Easy`
* [watchexec-cli](https://crates.io/crates/watchexec-cli): `brew install watchexec`
* [XMLStarlet](https://xmlstar.sourceforge.net/): `brew install xmlstarlet`

## Usage

Run `--help` or `-h` option to get a description of the tool and how to use it.

Export environment valiable `DEBUG` to print the underlying call with `sf` like

    export DEBUG=1
    sf-deploy

or

    DEBUG=1 sf-deploy

## Commands

1. `sf-data` downloads all data of Salesforce objects as csv files from an org.

1. `sf-deploy` builds, deploys and publishes a full project or deploys single entities from the git index in watch mode for ease of development.

1. `sf-inspect` inspect local custom-labels and their translations as well as permissions from profiles and permission-sets in a tabular manner.

1. `sf-log` creates or updates the debug log for a given debug-log user and streams log to console.

1. `sf-metadata` downloads all or specific metadata from an org.

1. `sf-rel` extracts and displays relations of a given object-id to other objects.

1. `sf-tooldata` downloads all data as csv files from an org using the Tooling API.

1. `sf-validate` validate a full project against an org and runs unit tests.

## Some Use Cases

### Compare Data between Orgs

    sf-data -o org1 -d .data1 -s Account
    sf-data -o org2 -d .data2 -s Account
    daff --www .data1/Account.csv .data2/Account.csv

### Download & Inspect Data in VisiData

To automatically open retrieved data in VisiData without downloading into your local folder, use the `-v` option:

    sf-data -v Account

### Inspect Relations of a given Object with other Objects of Interest

Supposed you are interested in the realations of an Account, e.g. `0019O00000Dc70zQAB`, with User, Contact and AccountContactRelation:

    sf-data -s Account -s User -s Contact -s AccountContactRelation
    cd .data
    sf-rel 0019O00000Dc70zQAB

### Deploy Files from Git Index to Org

Only deploying the files you are working on is way faster that always deploying the full project.

File changes are detected automatically and deployed on change in watch-mode for ease of development.

    sf-deploy

