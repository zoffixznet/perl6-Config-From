[![Build Status](https://travis-ci.org/zoffixznet/perl6-Config-From.svg)](https://travis-ci.org/zoffixznet/perl6-Config-From)

# NAME

Config::From - Load configuration from file to variables via traits

# SYNOPSIS

JSON config file `my-config.json`:

```json
{
    "user"  : "zoffix",
    "pass"  : "s3cret",
    "groups": [ "foo", "bar", "ber" ]
}
```

Program that uses it:

```perl6
use Config::From 'my-config.json'; # config file defaults to 'config.json'

# automatically load variables from config
my $user   is from-config;
my $pass   is from-config;
my @groups is from-config;

say "$user\'s password is $pass and they belong to @groups[]";
# Prints: zoffix's password is s3cret and they belong to foo, bar, ber
```

# DESCRIPTION

----

# REPOSITORY

Fork this module on GitHub:
https://github.com/zoffixznet/perl6-Config-From

# BUGS

To report bugs or request features, please use
https://github.com/zoffixznet/perl6-Config-From/issues

# AUTHOR

Zoffix Znet (http://zoffix.com/)

# LICENSE

You can use and distribute this module under the terms of the
The Artistic License 2.0. See the `LICENSE` file included in this
distribution for complete details.
