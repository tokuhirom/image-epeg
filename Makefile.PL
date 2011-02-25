use inc::Module::Install;
name 'Image-Epeg';
all_from 'lib/Image/Epeg.pm';
author 'Michael Curtis (mcurtis@yahoo-inc.com)';

libs '-ljpeg';

if ($^O eq 'MSWin32') {
    cc_optimize_flags '-DBUILDING_DLL';
};

test_requires 'Test::More' => 0.94;
setup_auto_repository;
author_tests("xt");
WriteAll;
