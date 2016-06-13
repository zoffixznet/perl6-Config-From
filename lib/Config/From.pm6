unit module Config::From;

use JSON::Fast;

sub EXPORT (Str:D $config-file = 'config.json') {
    my $conf = from-json $config-file.IO.slurp;
    return {};
}
