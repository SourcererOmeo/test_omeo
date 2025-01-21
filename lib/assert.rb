class AssertionError < StandardError; end

def assert(expectation)
  raise AssertionError if !expectation
end

if File.basename(__FILE__) == File.basename($0) && ARGV.empty?
  $FAILED = false
  def _assert_report(type, passed = true)
    $FAILED = true if !passed
    "\t - #{type}: #{passed ? "passed" : "failed"}"
  end

  puts "running tests for assert"
  begin
    assert(1 == 2)
    puts _assert_report("false value not raising", false)
  rescue AssertionError
    puts _assert_report("false value raising")
  end

  begin
    assert(1 == 1)
    puts _assert_report("true value not raises")
  rescue StandardError => e
    puts _assert_report("true raised: #{e.message}", false)
  end

  exit(-1) if $FAILED
end
