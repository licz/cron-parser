class Engine
  MINUTE_BASE = 59
  HOUR_BASE = 23
  DAY_OF_MONTH_BASE = 31
  MONTH_BASE = 12
  DAY_OF_WEEK_BASE = 6

  class << self
    def parse_minutes(string)
      new(string, 0, MINUTE_BASE).parse
    end

    def parse_hours(string)
      new(string, 0, HOUR_BASE).parse
    end

    def parse_day_of_month(string)
      new(string, 1, DAY_OF_MONTH_BASE).parse
    end

    def parse_months(string)
      new(string, 1, MONTH_BASE).parse
    end

    def parse_day_of_week(string)
      new(string, 0, DAY_OF_WEEK_BASE).parse
    end
  end

  def initialize(string_to_parse, iterated_from, iterated_to)
    @string_to_parse = string_to_parse
    @iterated_from = iterated_from
    @iterated_to = iterated_to
  end

  def parse
    return (iterated_from..iterated_to).to_a if string_to_parse == "*"

    result = []
    string_to_parse.split(",").each do |substring|
      if substring.include?("-") && substring.split("-")[0] != ""
        result.concat(get_range_elements(substring))
      elsif substring.include?("/")
        result.concat(get_interval_elements(substring))
      else
        result << get_single_element(substring)
      end
    end
    result.map(&:to_i).sort
  end

  def get_range_elements(substring)
    left = substring.split("-")[0].to_i
    right = substring.split("-")[1].to_i

    raise ArgumentError.new("Range incorrect #{substring}") if left > right || left > iterated_to || right > iterated_to || left < iterated_from

    return (left..right).to_a
  end

  def get_interval_elements(substring)
    result = []
    sum = 0
    interval = substring.split("/")[1].to_i

    raise ArgumentError.new("Interval incorrect #{substring}") if interval > iterated_to || interval < 0

    while sum < iterated_to
      result << sum
      sum += interval
    end
    return result
  end

  def get_single_element(substring)
    raise ArgumentError.new("Element incorrect #{substring}") if substring.to_i > iterated_to || substring.to_i < 0

    return substring
  end

  attr_accessor :string_to_parse, :iterated_from, :iterated_to
end
