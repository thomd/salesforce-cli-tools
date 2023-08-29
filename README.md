# Salesforce CLI Tools

## Install

Set symlinks to `~/bin/` folder:

    make link

or symlink to custom folder:

    make link BINDIR=/usr/local/bin/
    make link COMPLETIONSDIR=/etc/bash_completions.d

## Dependencies

This tool uses several non standard CLI tools:

* [sfdx](https://developer.salesforce.com/tools/salesforcecli): `npm install -g sfdx-cli`
* [VisiData](https://www.visidata.org/): `brew install saulpw/vd/visidata`
* [daff](https://paulfitz.github.io/daff/): `npm install -g daff`
* [jq](https://jqlang.github.io/jq/): `brew install jq`

## Use Cases

### Compare Accounts between Orgs

    sf-data -o org1 -d .data1 -s Account
    sf-data -o org2 -d .data2 -s Account
    daff --www .data1/Account.csv .data2/Account.csv

### Inspect Account Data

    sf-data -v Account
