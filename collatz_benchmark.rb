require 'benchmark'
require_relative 'collatz'

Benchmark.bm do |x|
  x.report("collatz_iterative") { longest_collatz_sequence_iterative }
  x.report("collatz_recursive") { longest_collatz_sequence_recursive }
end