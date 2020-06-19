# Zip Files Action

This GitHub action exposes the zip command for use in building/archiving. It is important to note that this action currently only supports Linux.

## Usage

Zipping the directory `vendor` into `vendor.zip`:

```yaml
- uses: gitchrisqueen/action-zip@master
  with:
    args: zip
    zipFile: vendor.zip
    zipFolder: vendor
```

Unzipping a `vendor.zip` file into `vendor` folder:

```yaml
- uses: gitchrisqueen/action-zip@master
  with:
    args: unzip
    zipFile: vendor.zip
    zipFolder: vendor
```
