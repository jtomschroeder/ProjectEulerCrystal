# You are given the following information, but you may prefer to do some research for yourself.
# 
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

require "problem"

def leap_year?(year)
  return true  if year % 400 == 0
  return false if year % 100 == 0
  return true  if year %   4 == 0
  false
end

def days_in_month(year)
  [31, leap_year?(year) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
end

problem 19 do 
  code do
    # day_of_week: 0 == Sunday, 1 == Monday, etc.
    day_of_week = (1 + days_in_month(1900).sum) % 7
    first_sundays = 0
    (1901..2000).each do |year|
      days_in_month(year).each do |num_days|
        first_sundays += 1 if day_of_week == 0
        day_of_week = (day_of_week + num_days) % 7
      end
    end
    first_sundays
  end
  expect 171
end
