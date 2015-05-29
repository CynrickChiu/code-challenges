# blur version 3

class Image

  attr_accessor :rows

  def initialize(rows)
    self.rows = rows
  end

  def output_image
    rows.each do |row|
      row.each do |element|
        print "#{element} "
      end

      puts
    end
  end

  def blur
    elements_per_row = rows[0].size
    flattened = rows.flatten
    blurred = flattened.dup

    flattened.each_index do |index|
      if flattened[index] == 1
        # change pixel to the left
        blurred[index - 1] = 1 unless index - 1 < 0 || index % elements_per_row == 0

        # change pixel to the right
        blurred[index + 1] = 1 unless (index + 1) % elements_per_row == 0 || index + 1 >= flattened.size

        # change pixel to the top
        blurred[index - elements_per_row] = 1 unless index - elements_per_row < 0

        # change pixel to the bottom
        blurred[index + elements_per_row] = 1 unless index + elements_per_row >= flattened.size
      end
    end

    result = []

    until blurred.empty? do
      result << blurred.shift(elements_per_row)
    end

    self.rows = result
    rows
  end

  def blur_distance(distance)
    until distance == 0 do
      blur
      distance -= 1
    end
  end

end