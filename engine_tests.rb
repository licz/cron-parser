require './engine'

class EngineSpec

  TEST_PARAMETERS = [
    ["Should iterate over comma separated elements", Engine.new("1,2,3", 0, 5), [1, 2, 3]],
    ["Should return correct invervals", Engine.new("*/5", 0, 15), [0,5,10]],
    ["Should return correct ranges", Engine.new("4-6", 0, 15), [4,5,6]],
    ["Should return correct elements", Engine.new("1,2,3,7-9,*/5,", 0, 30), [0, 1, 2, 3, 5, 7, 8, 9, 10, 15, 20, 25]],
    ["Should throw exception when using negatives", Engine.new("-5", 0, 30), ["exception", "Element incorrect -5"]],
    ["Should throw exception when element outside of bounds", Engine.new("31", 0, 30), ["exception", "Element incorrect 31"]],
    ["Should throw exception when element outside of bounds with intervals", Engine.new("*/5", 0, 4), ["exception", "Interval incorrect */5"]]
  ]

  def self.run_tests
    TEST_PARAMETERS.each do |parameter|
      begin
        result = parameter[1].parse
        if result == parameter[2]
          puts "#{parameter[0]}: test ok"
        else
          puts "test failed: #{parameter[0]}, expected: #{parameter[2]}, actual: #{result}"
        end
      rescue ArgumentError => error
        if "exception" == parameter[2][0] && error.to_s == parameter[2][1]
          puts "#{parameter[0]}: test ok"
        else
          puts "test failed: #{parameter[0]}, error expected: #{parameter[2][1]}, got error: #{error}"
        end
      end
    end
  end
end

EngineSpec.run_tests
