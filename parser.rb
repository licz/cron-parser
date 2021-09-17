require './engine'
require './printer'

DIVIDER = "------------------------"

class Parser
  def self.parse_input(cron_command)
    minute, hour, day_of_month, month, day_of_week, command = cron_command.split(" ")

    Printer.print(
      Engine.parse_minutes(minute),
      Engine.parse_hours(hour),
      Engine.parse_day_of_month(day_of_month),
      Engine.parse_months(month),
      Engine.parse_day_of_week(day_of_week),
      command
    )
  end
end

def run_examples
  examples = [
    "0 8 * * * command",
    "*/15 0 1,15 * 1-5 command",
    "0 0 * * * command",
    "1,2,5-7,11 * * * * command"
  ]
  puts "running examples"
  examples.each do |example|
    puts DIVIDER, example
    Parser.parse_input(example)
  end
  puts "examples finished", DIVIDER
end

run_examples if ARGV.include?("-run-examples")
Parser.parse_input(ARGV.first)
