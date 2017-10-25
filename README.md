# Ruta Destroy
forked from [Haikunator](https://github.com/usmanbashir/haikunator)

[![Gem Version](https://badge.fury.io/rb/ruta_destroy.svg)](http://badge.fury.io/rb/ruta_destroy)
[![Build Status](https://travis-ci.org/demipel8/ruta_destroy.svg?branch=master)](https://travis-ci.org/demipel8/ruta_destroy)
[![Coverage Status](https://coveralls.io/repos/demipel8/ruta_destroy/badge.svg)](https://coveralls.io/r/demipel8/ruta_destroy)

Generate Heroku-like memorable random names to use in your apps or anywhere else with names from ruta destroy.

## Installation

Add this line to your application's Gemfile:

    gem 'ruta_destroy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruta_destroy

## Usage

Ruta destroy is pretty simple. There is nothing to configure and it only has a single method, `.sesion`:

```ruby
RutaDestroy.sesion # => "LuisBonias-Penelope-3014"

# Token range
RutaDestroy.sesion(100) # => "RafaMarco-Bananas-47"

# Don't include the token
RutaDestroy.sesion(0) # => "CarlosSimo-Bodegón"

# Use a different delimiter
RutaDestroy.sesion(9999, '.') # => "LuisBonías.Penelope.4214"

# No token, no delimiter
RutaDestroy.sesion(0, ' ') # => "PacoPil Distrito10"
```

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/demipel8/ruta_destroy/issues)
- Fix bugs and [submit pull requests](https://github.com/demipel8/ruta_destroy/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features
