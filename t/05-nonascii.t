#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use Test::More tests => 3;
use Domain::PublicSuffix;

my $ps = Domain::PublicSuffix->new();
is( $ps->get_root_domain('xn--p8j9a0d9c9a.xn--q9jyb4c'), 'xn--p8j9a0d9c9a.xn--q9jyb4c', 'ascii idn' );
is( $ps->get_root_domain('名がドメイン.com'), '名がドメイン.com', 'utf8' );
is( $ps->get_root_domain('xn--v8jxj3d1dzdz08w.com'), 'xn--v8jxj3d1dzdz08w.com', 'ascii utf8' );

done_testing();

1;
