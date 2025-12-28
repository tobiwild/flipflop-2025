input = ARGF.read.chomp

i = 0
p1 = 0
p3 = 0
visited = Set.new

loop do
  char = input[i]
  visited << char
  j = input.index(char)
  j = input.index(char, j + 1) if i == j
  steps = (i - j).abs
  p1 += steps
  steps *= -1 if char == char.upcase
  p3 += steps
  break if j + 1 >= input.size

  i = j + 1
end

p2 = input
     .chars
     .uniq
     .reject { visited.include?(it) }
     .join

puts p1
puts p2
puts p3
