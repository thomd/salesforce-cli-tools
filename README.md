# Salesforce CLI Tools

## Install

Set symlinks to `~/bin/` folder:

    make

Alternatively symlink to custom folders:

    make BINDIR=/usr/local/bin/
    make COMPLETIONSDIR=/etc/bash_completions.d

## Dependencies

This tool uses several non standard CLI tools:

* [sfdx](https://developer.salesforce.com/tools/salesforcecli): `npm install -g sfdx-cli`
* [jq](https://jqlang.github.io/jq): `brew install jq`
* [VisiData](https://www.visidata.org): `brew install saulpw/vd/visidata`
* [daff](https://paulfitz.github.io/daff): `npm install -g daff`
* [csvkit](https://csvkit.readthedocs.io/en/latest): `brew install csvkit`

## Use Cases

### Compare Account Data between Orgs

    sf-data -o org1 -d .data1 -s Account
    sf-data -o org2 -d .data2 -s Account
    daff --www .data1/Account.csv .data2/Account.csv

### Inspect Account Data of Default Org

    sf-data -v Account

### Inspect Relations of a given Account with other Objects of Interest

Supposed you are interested in the realations of an Account `0018E000027VckFQAS` with User, Contact and AccountContactRelation:

    sf-data -s Account -s User -s Contact -s AccountContactRelation
    cd .data
    sf-rel -l 2 0018E000027VckFQAS
    vd *.csv
