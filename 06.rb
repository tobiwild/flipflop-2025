SPEEDS = ARGF.read.split("\n").map { it.split(',').map(&:to_i) }

def birds_in_frame(seconds:, times:)
  SPEEDS.sum do |sx, sy|
    bx = 0
    by = 0
    times.times.count do
      bx = (bx + seconds * sx) % 1000
      by = (by + seconds * sy) % 1000
      bx >= 250 && bx < 750 && by >= 250 && by < 750
    end
  end
end

puts birds_in_frame(seconds: 100, times: 1)
puts birds_in_frame(seconds: 3600, times: 1000)
puts birds_in_frame(seconds: 31_556_926, times: 1000)
