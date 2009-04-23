#!/usr/local/bin/perl -w

use strict;
use Image::Epeg qw(:constants);

my @i = stat( "t/test.jpg" );
my $rawimgsize = $i[7];

print "1..8\n";

my $f = undef;
open F, "t/test.jpg";
$f .= $_ while <F>;
close F;


# Test 1: new( [reference] )
my $epeg = new Image::Epeg( \$f );
print defined $epeg ? "ok\n" : "nok\n";

# Test 2: get_width()
print $epeg->get_width() == 640 ? "ok\n" : "nok\n";

# Test 3: get_height()
print $epeg->get_height() == 480 ? "ok\n" : "nok\n";

# resize() setup
$epeg->resize( 150, 150, MAINTAIN_ASPECT_RATIO );

# set_comment() setup
$epeg->set_comment( "foobar" );

# Test 4: save();
$epeg->write_file( "t/test2.jpg" );
print -f "t/test2.jpg" ? "ok\n" : "nok\n";

# Test 5: Expected size? 
@i = stat( "t/test2.jpg" );
print $i[7] == 3035 ? "ok\n" : "nok\n";


# Test 6: new( [file] )
$epeg = new Image::Epeg( "t/test2.jpg" );
print defined $epeg ? "ok\n" : "nok\n";

# Test 7: get_comment()
print $epeg->get_comment() eq "foobar" ? "ok\n" : "nok\n";

# set_quality() setup
$epeg->set_quality( 10 );

# Test 8: get_data()
$epeg->resize( $epeg->get_height(), $epeg->get_width() );
my $data = $epeg->get_data();
print $data && length($data) == 1083 ? "ok\n" : "nok\n";

system "rm t/test2.jpg";

exit 0;
