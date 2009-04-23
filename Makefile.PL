use ExtUtils::MakeMaker;

WriteMakefile
(
	'NAME'			=> 'Image::Epeg',
	'VERSION_FROM'	=> 'Epeg.pm',
    'PREREQ_PM'		=> {},
	($] >= 5.005 ?
		(ABSTRACT_FROM	=> 'Epeg.pm',
		AUTHOR			=> 'Michael Curtis (mcurtis@yahoo-inc.com)') : ()),
	'LIBS'			=> ['-ljpeg'],
	'DEFINE'		=> '',
	'INC'			=> ''
);
