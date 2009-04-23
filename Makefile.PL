use ExtUtils::MakeMaker;

WriteMakefile
(
	'NAME'			=> 'Image::Epeg',
	'VERSION_FROM'	=> 'lib/Image/Epeg.pm',
    'PREREQ_PM'		=> {},
	($] >= 5.005 ?
		(ABSTRACT_FROM	=> 'lib/Image/Epeg.pm',
		AUTHOR			=> 'Michael Curtis (mcurtis@yahoo-inc.com)') : ()),
	'LIBS'			=> ['-ljpeg'],
	'DEFINE'		=> '',
	'INC'			=> ''
);
