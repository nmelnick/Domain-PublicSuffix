#!/usr/bin/env perl
use Test::More;
use Domain::PublicSuffix;

my %data = (
	'www.911.state.tx.us'               => 'state.tx.us',
	'www.achd.ada.id.us'                => 'ada.id.us',
	'www.alamo_williams_nd.godcool.com' => 'godcool.com',
	'www.poland.gov.pl'                 => 'poland.gov.pl',
	'www.superior_one.com'              => 'superior_one.com',
	'openfusion.com.au'                 => 'openfusion.com.au',
);

my @bad = (
	# .au only allows 3lds
	'bogus.au',
);

ok($dps = Domain::PublicSuffix->new({ domain_allow_underscore => 1 }), 'constructor ok');

foreach my $hostname ( sort keys %data ) {
	my $root_domain = $dps->get_root_domain($hostname);
	is( $root_domain, $data{$hostname}, "$hostname ok" );
}

foreach my $hostname (@bad) {
	my $root_domain = $dps->get_root_domain($hostname);
	is( $root_domain, undef, "$hostname correctly invalid: " . $dps->error );
}

done_testing();

1;
