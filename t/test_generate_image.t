use strict;
use warnings;

use Test::More;
use Test::Exception;

BEGIN { use_ok( 'WKHTMLTOX::XS' ); }
require_ok( 'WKHTMLTOX::XS' );

can_ok('WKHTMLTOX::XS', qw(generate_image));

dies_ok { WKHTMLTOX::XS::generate_image(@{[]}); } 'Expecting die';
dies_ok { WKHTMLTOX::XS::generate_image([]); } 'Expecting die';

generate_image({out => 't/test_a.jpg', in => "http://www.google.com", fmt => "jpeg"});
generate_image({out => 't/test_b.jpg', in => "/data/affinitylive_api/modules/AffinityLive/XS/WKHTMLTOX/t/test.html", fmt => "jpeg"});

done_testing();