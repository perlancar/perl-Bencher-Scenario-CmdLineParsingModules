package Bencher::Scenario::CmdLineParsingModules;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark command-line parsing modules',
    modules => {
        'Complete::Bash' => {version=>0.27},
    },
    participants => [
        {
            fcall_template => 'Parse::CommandLine::parse_command_line(<cmdline>)',
            result_is_list => 1,
        },
        {
            fcall_template => 'Complete::Bash::parse_cmdline(<cmdline>, 0)',
        },
        {
            fcall_template => 'Text::ParseWords::shellwords(<cmdline>)',
            result_is_list => 1,
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
