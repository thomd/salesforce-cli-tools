# Salesforce CLI Tools

A collection of bash scripts for my daily work with Salesforce.

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
* [csvkit](https://csvkit.readthedocs.io/en/latest): `brew install csvkit`
* [watchexec-cli](https://crates.io/crates/watchexec-cli): `brew install watchexec`

## Usage

Run `--help` or `-h` option to get a description of the tool and how to use it.

## Use Cases

### Compare Account Data between Orgs

    sf-data -o org1 -d .data1 -s Account
    sf-data -o org2 -d .data2 -s Account
    daff --www .data1/Account.csv .data2/Account.csv

### Inspect Account Data in VisiData

    sf-data -v Account

### Inspect Relations of a given Account with other Objects of Interest

Supposed you are interested in the realations of an Account `0018E000027VckFQAS` with User, Contact and AccountContactRelation:

    sf-data -s Account -s User -s Contact -s AccountContactRelation
    cd .data
    sf-rel -l 2 0018E000027VckFQAS
    vd *.csv

### Deploy Files from Git Index to Org

Only deploying the files you are working on is way faster that always deploying the full project. 

File changes are detected automatically and deployed on change for ease of development.

    sf-deploy

There are some pitfalls though, supposed you create a new class which will then be deployed automatically and then remove the class, then this class will not be deleted on the org.
