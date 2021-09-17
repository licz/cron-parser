class Printer
  NEWLINE = "\n"
  def self.print(minutes, hours, day_of_month, months, day_of_week, command)
    puts "minute".ljust(14) + minutes.join(" ") + NEWLINE +
      "hour".ljust(14) + hours.join(" ") + NEWLINE +
      "day of month".ljust(14) + day_of_month.join(" ") + NEWLINE +
      "month".ljust(14) + months.join(" ") + NEWLINE +
      "day of week".ljust(14) + day_of_week.join(" ") + NEWLINE +
      "command".ljust(14) + command
  end
end
