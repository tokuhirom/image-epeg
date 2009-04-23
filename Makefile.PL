use ExtUtils::MakeMaker;

$ROOT       = "/usr/local";

WriteMakefile
(
	'NAME'			=> 'Image::Epeg',
	'VERSION_FROM'	=> 'Epeg.pm',
    'PREREQ_PM'		=> {},
	($] >= 5.005 ?
		(ABSTRACT_FROM	=> 'Epeg.pm',
		AUTHOR			=> 'Michael Curtis (mcurtis@yahoo-inc.com)') : ()),
	'LIBS'			=> [''],
	'LIBS'			=> "-L$ROOT/lib -lepeg" . "$LDLIBS",
	'DEFINE'		=> '',
	'INC'			=> ''
);
