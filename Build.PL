use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
    license              => 'perl',
    dynamic_config       => 0,

    build_requires       => {
        'Test::More' => '0.98',
        'Test::Requires' => 0,
    },
    configure_requires   => { 'Module::Build' => '0.38' },
    requires             => {
        perl => '5.010001',
        'parent'                        => '0',
        'AnyEvent' => 7.02,
        'Data::MessagePack' => '0.46',
        'Data::MessagePack::Stream' => 0.07,
    },

    no_index    => { 'directory' => [ 'inc' ] },
    name        => 'AnyEvent-MessagePack',
    module_name => 'AnyEvent::MessagePack',

    # script_files => [''],

    test_files => (-d '.git' || $ENV{RELEASE_TESTING}) ? 't/ xt/' : 't/',
    recursive_test_files => 1,
   
    create_readme  => 1,
    create_license => 1,
);
$build->create_build_script();
