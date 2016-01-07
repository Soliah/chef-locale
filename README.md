[![Build Status](https://travis-ci.org/Soliah/chef-locale.svg)](https://travis-ci.org/Soliah/chef-locale)

# chef-locale

Set the locale on Ubuntu.

## Requirements

Only tested to be working on the following Ubuntu and Debian versions below, but may work on earlier versions too.

- Ubuntu 14.04
- Ubuntu 12.04

## Attributes

### locale::default

Key                  | Type   | Default      | Description
:--------------------|--------|--------------|-------------------------------------------------
`["locale"]["lang"]` | String | `en_US.utf8` | Sets LANG
`["locale"]["lang"]` | String | `en_US.utf8` | Sets LC_ALL

## Usage

Just include `locale` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[locale]"
  ]
}
```
