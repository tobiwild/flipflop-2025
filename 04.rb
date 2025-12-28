input = ARGF
        .read
        .split("\n")
        .map { it.split(',').map(&:to_i) }
        .prepend([0, 0])

# part 1
input
  .each_cons(2)
  .sum { it.transpose.sum { it.reduce(:-).abs } }
  .tap { puts it }

# part 2
input
  .each_cons(2)
  .sum do
    it
      .transpose
      .map { it.reduce(:-).abs }
      .max
  end
  .tap { puts it }

# part 3
input
  .sort_by(&:sum)
  .each_cons(2)
  .sum do
    it
      .transpose
      .map { it.reduce(:-).abs }
      .max
  end
  .tap { puts it }
