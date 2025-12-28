def binom(n, k)
  k = n - k if k * 2 > n
  (1..k).reduce(1) { |acc, i| acc * (n - i + 1) / i }
end

p1 = 0
p2 = 0
p3 = 0

ARGF.each_line do |line|
  x, y = line.split.map(&:to_i)
  x_steps = x - 1
  y_steps = y - 1

  p1 += binom(
    x_steps + y_steps,
    x_steps
  )

  p2 += [
    binom(
      x_steps + y_steps + x_steps,
      x_steps
    ),
    binom(
      x_steps + y_steps,
      x_steps
    )
  ].reduce(:*)

  p3 += (1..x)
        .map { binom(it * y_steps, y_steps) }
        .reduce(:*)
end

puts p1
puts p2
puts p3
