# Thinreports::CLI

[![Gem Version](https://badge.fury.io/rb/thinreports-cli.svg)](https://badge.fury.io/rb/thinreports-cli)

**Unofficial** and **Experimental** Thinreports command-line tool.

## Installation

    $ gem install thinreports-cli --pre

## Commands

### $ thinreports upgrade

Upgrade .tlf schema to 0.9.x from 0.8.x:

```
$ thinreports upgrade /path/to/old-0.8.x.tlf /path/to/new-0.9.x.tlf
```

## Requirements

 - Ruby 2.0.0+
 - thinreports 0.9.x

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hidakatsuya/thinreports-cli.

## Plan

 - Write tests
 - Implement `thinreports generate --json /path/to/data.json /path/to/result.pdf` command

## Copyright

Copyright © 2016 Katsuya Hidaka. See MIT-LICENSE for further details.
