#!/usr/local/bin/perl -w

use strict;
use warnings;
use Test::More tests => 8;
use Image::Epeg qw(:constants);

my @i = stat( "t/test.jpg" );
my $rawimgsize = $i[7];

my $f = undef;
{
    open my $fh, "t/test.jpg";
    $f .= $_ while <$fh>;
    close $fh;
}


# Test 1: new( [reference] )
my $epeg = new Image::Epeg( \$f );
ok defined $epeg;

# Test 2: get_width()
is $epeg->get_width(), 640;

# Test 3: get_height()
is $epeg->get_height(), 480;

# resize() setup
$epeg->resize( 150, 150, MAINTAIN_ASPECT_RATIO );

# set_comment() setup
$epeg->set_comment( "foobar" );

# Test 4: save();
$epeg->write_file( "t/test2.jpg" );
ok -f "t/test2.jpg";

# Test 5: Expected size? 
@i = stat( "t/test2.jpg" );
is $i[7], 3035;


# Test 6: new( [file] )
$epeg = new Image::Epeg( "t/test2.jpg" );
ok defined $epeg;

# Test 7: get_comment()
is $epeg->get_comment(), "foobar";

# set_quality() setup
$epeg->set_quality( 10 );

# Test 8: get_data()
$epeg->resize( $epeg->get_height(), $epeg->get_width() );
my $data = $epeg->get_data();
ok $data && length($data) == 1083;

unlink 't/test2.jpg';

