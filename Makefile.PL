use inc::Module::Install;
name 'Image-Epeg';
all_from 'lib/Image/Epeg.pm';
author 'Michael Curtis (mcurtis@yahoo-inc.com)';

libs '-ljpeg';

setup_auto_repository;
author_tests("xt");
WriteAll;
