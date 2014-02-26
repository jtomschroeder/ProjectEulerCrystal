# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
# NOTE: Do not count spaces or hyphens. The use of "and" when writing out numbers is in compliance with British usage.

require "problem"

below_10 = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

below_20 = ["ten",
            "eleven",
            "twelve",
            "thirteen",
            "fourteen",
            "fifteen",
            "sixteen",
            "seventeen",
            "eighteen",
            "nineteen"]

below_100 = ["",
             "",
             "twenty",
             "thirty",
             "forty",
             "fifty",
             "sixty",
             "seventy",
             "eighty",
             "ninety"]

problem 17 do
  code do
    count = 0
    (1..999).each do |i|
      while i > 0
        case i
        when 100..999
          count += below_10[i / 100].length + "hundred".length
          i %= 100
          count += "and".length if i > 0
        when 20..99
          count += below_100[i / 10].length
          i %= 10
        when 10..19
          count += below_20[i - 10].length
          i %= 1
        when 0..9
          count += below_10[i].length
          i = 0
        end
      end
    end
    count + ("one" + "thousand").length
  end
  expect 21124
end