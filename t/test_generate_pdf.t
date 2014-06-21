use strict;
use warnings;

use Test::More;
use Test::Exception;

BEGIN { use_ok( 'WKHTMLTOX::XS' ); }
require_ok( 'WKHTMLTOX::XS' );

can_ok('WKHTMLTOX::XS', qw(generate_pdf));

dies_ok { WKHTMLTOX::XS::generate_pdf({},[]); } 'Expecting die';
dies_ok { WKHTMLTOX::XS::generate_pdf([],{}); } 'Expecting die';
dies_ok { WKHTMLTOX::XS::generate_pdf([],[]); } 'Expecting die';
dies_ok { WKHTMLTOX::XS::generate_pdf('',{}); } 'Expecting die';
dies_ok { WKHTMLTOX::XS::generate_pdf({},''); } 'Expecting die';
dies_ok { WKHTMLTOX::XS::generate_pdf(@{[]},{}); } 'Expecting die';
dies_ok { WKHTMLTOX::XS::generate_pdf({},@{[]}); } 'Expecting die';

generate_pdf({out => 't/test_a.pdf'},{page => "http://www.google.com"});
generate_pdf({out => 't/test_b.pdf'},{page => "/data/affinitylive_api/modules/AffinityLive/XS/WKHTMLTOX/t/test.html"});

done_testing();