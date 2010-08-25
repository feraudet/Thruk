use strict;
use warnings;
use Test::More tests => 106;

BEGIN {
    use lib('t');
    require TestUtils;
    import TestUtils;
}

my $pages = [
    '/thruk/main.html',
    '/thruk/side.html',
    '/thruk/cgi-bin/status.cgi',
];

for my $theme (TestUtils::get_themes()) {
    for my $url (@{$pages}) {
        TestUtils::test_page(
            'url'     => $url."?theme=".$theme,
            'like'    => 'Configuration',
            'unlike'  => 'internal server error',
        );
    }
}
