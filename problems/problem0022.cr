# Using names.txt, a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. 
# Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
# 
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. 
# So, COLIN would obtain a score of 938 × 53 = 49714.
#
# What is the total of all the name scores in the file?

require "problem"

problem 22 do
  code do
    total_scores = 0
    File.read("names.txt").replace('"', "").split(',').sort.each_with_index do |name, i|
      sum = 0
      name.each_char { |c| sum += c - 'A' + 1 }
      total_scores += sum * (i + 1)
    end
    total_scores
  end
  expect 871198282
end
