#!/usr/local/bin/perl -w

use strict;
use Image::Epeg qw(:constants);

my @i = stat( "t/epeg_crash.jpg" );
my $rawimgsize = $i[7];

print "1..5\n";


# Test 1: new( [file] )
my $epeg = new Image::Epeg( "t/epeg_crash.jpg" );
print defined $epeg ? "ok\n" : "nok\n";


# Test 2: get_width(), get_height()
print $epeg->get_width() == 550 ? "ok\n" : "nok\n";
print $epeg->get_height() == 384 ? "ok\n" : "nok\n";


# Test 3: resize()
$epeg->resize( 150, 150, MAINTAIN_ASPECT_RATIO );
$epeg->set_comment( "test comment" );
$epeg->set_quality( 80 );


# Test 4: write_file()
my $rc = $epeg->write_file( "t/epeg_crash2.jpg" );
print $rc ? "nok\n" : "ok\n";


# Test 5: new( [file] )
# Will fail because we're trying to open a gif.
# Test graceful recovery
$epeg = new Image::Epeg( "t/test.gif" );
print $epeg ? "nok\n" : "ok\n";

exit 0;
