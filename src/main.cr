require "./time_it"
require "option_parser"

interpreter = String.new
prog = String.new
args = String.new
runs : Int32 = 10
log : Bool = false
clear_log : Bool = false
log_path = Path.new(Path.home, ".cache", "time-it.log")

OptionParser.parse do |parser|
  parser.banner = "time-it: a simple executable timer\n" \
                  "usage: time-it [flags] [exe or interpreted] [program name or path to program]\n"
  parser.on("-l", "--log", "write generated output to the log file at ~/.cache/time-it.log\n") { log = true }
  parser.on("-cl", "--clear-log", "clear the log at ~/.cache/time-it.log\n") { clear_log = true }
  parser.on("-i INTERPRETER", "--interpreter=INTERPRETER", "set interpreter to be used to INTERPRETER\n") { |_interpreter| interpreter = _interpreter }
  parser.on("-e EXECUTABLE", "--executable=EXECUTABLE", "set the executable to be times to EXECUTABLE\n") { |executable| prog = executable }
  parser.on("-a 'ARGS'", "--args='ARGS'", "set the arguments for the timed program\n") { |_args| args = _args }
  parser.on("-r INT", "--runs=INT", "set the number of runs to time the program\n") { |int| runs = int.to_i }
  parser.on("-lp PATH", "--log-path=PATH", "set the path of the log file for this run to PATH\n") { |path| log_path = Path.new(path) }
  parser.on("-h", "--help", "show this help message") do
    puts parser
    exit 1
  end
  parser.invalid_option do |flag|
    STDERR.puts "#{flag} is an invalid option"
    STDERR.puts parser
    exit -1
  end
end

if interpreter = ""
  exe = "#{prog}"
else
  exe = "#{interpreter} #{prog}"
end

unless args == ""
  args_array = args.split(" ")
end

unless exe == ""
  result = TimeIt.time_it(exe, args_array, runs)
  result_string = "\n#{result[0]}\n#{result[1]}\n"
  puts result_string
end

if clear_log
  File.write(log_path, "")
end

if log
  File.open(log_path, "a") do |file|
    file.print "timing data for #{prog} on #{Time.local}:#{result_string}"
  end
end
