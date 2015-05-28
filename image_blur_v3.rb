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
    elements_per_row = self.rows[0].size
    flattened = self.rows.flatten
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
    self.rows
  end

  def blur_distance(distance)
    until distance == 0 do
      blur
      distance -= 1
    end
  end

end

=begin
image1 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0]
])

puts 'Original image #1:'
image1.output_image
puts
image1.blur
puts 'Image #1 after running blur method:'
image1.output_image

puts
puts

image2 = Image.new([
  [1, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])

puts 'Original image #2:'
image2.output_image
puts
image2.blur_distance(3)
puts 'Image #2 after running blur_distance(3):'
image2.output_image
=end