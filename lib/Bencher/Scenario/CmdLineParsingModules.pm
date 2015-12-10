package Bencher::Scenario::CmdLineParsingModules;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark command-line parsing modules',
    participants => [
        {
            fcall_template => 'Parse::CommandLine::parse_command_line(<cmdline>)',
            result_is_list => 1,
        },
        {
            fcall_template => 'Complete::Bash::parse_cmdline(<cmdline>, 0)',
        },
    ],

    datasets => [
        {
            name => 'empty',
            args => {
                cmdline => q[],
            },
        },
        {
            name => 'cmd-only',
            args => {
                cmdline => q[somecmd],
            },
        },
        {
            name => '2args-simple',
            args => {
                cmdline => q[somecmd arg1 arg-two],
            },
        },
        {
            name => '4args',
            args => {
                cmdline => q[command '' arg1 "arg2 in quotes" arg3\\ with\\ spaces "arg4 with \\"quotes\\" and \\\\backslash"],
            },
        },
    ],
};

1;
# ABSTRACT:

=head1 SYNOPSIS

 % bencher -m CmdLineParsingModules [other options]...


=head1 SEE ALSO
