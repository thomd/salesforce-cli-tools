# Salesforce CLI Tools

## Install

Set symlinks to `~/bin/` folder:

    make

or symlink to custom folder:

    make BINDIR=/usr/local/bin/

## Dependencies

This tool uses several non standard CLI tools:

1. [sfdx](https://developer.salesforce.com/tools/salesforcecli): `npm install -g sfdx-cli`
1. [VisiData](https://www.visidata.org/): `brew install saulpw/vd/visidata`
1. [daff](https://paulfitz.github.io/daff/): `npm install -g daff`
1. [jq](https://jqlang.github.io/jq/): `brew install jq`

## Use Cases

### Compare Users between Orgs

    sf-data -u b2bdev1 -d .data1 -o User
    sf-data -u b2bdev2 -d .data2 -o User
    daff --www .data1/User.csv .data2/User.csv
