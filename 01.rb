p1 = 0
p2 = 0
p3 = 0

ARGF.each_line(chomp: true) do |line|
  score = line.size / 2
  p1 += score
  p2 += score if score.even?
  p3 += score unless line.include?('e')
end

puts p1
puts p2
puts p3
