input = ARGF.read.chomp.chars.map { it == '^' ? 1 : -1 }

# part 1
input
  .reduce([0, 0]) do |(max, curr), it|
    curr += it
    [[max, curr].max, curr]
  end
  .tap { puts it.first }

# part 2
input
  .reduce([0, 0, 1, nil]) do |(max, curr, delta, prev), it|
    delta = 1 if it != prev
    curr += it * delta
    [
      [max, curr].max,
      curr,
      delta + 1,
      it,
    ]
  end
  .tap { puts it.first }

# part 3
def fib(n)
  return n if n < 2
  fib(n-1) + fib(n-2)
end

input
  .chunk { it }
  .map { |v, group| fib(group.size) * v }
  .reduce([0, 0]) do |(max, curr), it|
    curr += it
    [[max, curr].max, curr]
  end
  .tap { puts it.first }
