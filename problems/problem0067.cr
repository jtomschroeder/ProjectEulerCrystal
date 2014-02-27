# By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
# 
#    3
#   7 4
#  2 4 6
# 8 5 9 3
# 
# That is, 3 + 7 + 4 + 9 = 23.
# Find the maximum total from top to bottom in triangle.txt, a 15K text file containing a triangle with one-hundred rows.

require "problem"

problem 67 do
  code do
    triangle = File.read("triangle.txt").split('\n').map { |e| e.split(' ').map { |i| i.to_u64 } }

    # Optimal Substructure - DP

    (triangle.length - 2).downto(0) do |i|
      triangle[i].length.times { |j| triangle[i][j] += Math.max(triangle[i + 1][j], triangle[i + 1][j + 1]) }
    end

    triangle[0][0]
  end
  expect 7273
end
