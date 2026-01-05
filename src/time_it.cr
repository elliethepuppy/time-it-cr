# i don't really know what kind of documentation this needs because it
# just feels so painfully straightforward...
module TimeIt
  extend self
  VERSION = "0.1.1"

  # `time_it` is the function that actually times the program.
  # it does this by taking a `String` *exe* and (optionally)
  # an `Array(String) | Nil` *args*, then feeding
  # it to `Process.run` *runs* number of times, timing each run
  # and placing it into an array for later formatting.
  def time_it(exe : String,
              args : Array(String) | Nil = nil,
              runs : Int32 = 10) : Tuple(String, String)
    all_times = Array(Float64).new
    avg_time : Float64 = 0.0
    i : Int32 = 0
    unless args.nil?
      until i == runs
        start = Time.monotonic.to_f
        Process.run exe, args
        finish = Time.monotonic.to_f
        all_times << finish - start
        i += 1
      end
    else
      until i == runs
        start = Time.monotonic.to_f
        Process.run exe
        finish = Time.monotonic.to_f
        all_times << finish - start
        i += 1
      end
    end

    avg_time = all_times.sum / all_times.size

    return Tuple.new("average time: #{avg_time}", format_times all_times)
  end

  # `format_times` is simply a helper function that formats
  # the times in `time_it`'s *all_times* array into a nice,
  # numbered, and line-broken string for presentation to the
  # user and placement in the log file
  def format_times(times : Array(Float64)) : String
    string = String.new
    i : UInt32 = 0

    times.each do
      string += "run \##{i + 1}: #{times[i]}\n"
      i += 1
    end

    return string
  end
end
