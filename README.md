# Salesforce CLI Tools

## Install

Set symlinks to `~/bin/` folder:

    make

or symlink to custom folder:

    make BINDIR=/usr/local/bin/

## Dependencies

This tool uses several non standard CLI tools:

* [sfdx](https://developer.salesforce.com/tools/salesforcecli): `npm install -g sfdx-cli`
* [VisiData](https://www.visidata.org/): `brew install saulpw/vd/visidata`
* [daff](https://paulfitz.github.io/daff/): `npm install -g daff`
* [jq](https://jqlang.github.io/jq/): `brew install jq`

## Use Cases

### Compare Accounts between Orgs

    sf-data -u b2bdev1 -d .data1 -o Account
    sf-data -u b2bdev2 -d .data2 -o Account
    daff --www .data1/Account.csv .data2/Account.csv
