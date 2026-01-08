# time_it

time-it is an application for timing another application. this is a crystal implementation. the basis for this is my original [python implementation](https://github.com/elliethepuppy/time-it). you can read the full documentation [here](https://elliethepuppy.github.io/time-it)

## Installation

to install, you can build from source, or download a compiled binary from the releases section.

build instructions are simple. from the `time-it-cr` directory, run

``` bash
crystal build src/main.cr -o /path/to/destination/for/time-it --release --no-debug
```

## Usage

```
usage: time-it [flags] [exe or interpreted] [program name or path to program]

    -l, --log                        write generated output to the log file at ~/.cache/time-it.log

    -cl, --clear-log                 clear the log at ~/.cache/time-it.log

    -no, --no-output                 run the program without generating output to the terminal (use -l to get the info)
    -i INTERPRETER, --interpreter=INTERPRETER
                                     set interpreter to be used to INTERPRETER

    -e EXECUTABLE, --executable=EXECUTABLE
                                     set the executable to be times to EXECUTABLE

    -a 'ARGS', --args='ARGS'         set the arguments for the timed program

    -r INT, --runs=INT               set the number of runs to time the program

    -lp PATH, --log-path=PATH        set the path of the log file for this run to PATH

    -v, --version                    display the version number
    -h, --help                       show this help message

```

in order to call `time-it` from anywhere, you'll need to add it to your PATH. you can do this any number of ways, so i'll leave you to deciding the best for you. you can read the full documentation [here](https://elliethepuppy.github.io/time-it)

## Development

there's no real need to develop on top of this, so i leave it to you to determine the best methods for that.

## Contributing

if you can make any better decsions, feel free to follow these steps:

1. Fork it (<https://github.com/elliethepuppy/time-it-cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [ellie](https://github.com/elliethepuppy) - creator and maintainer
