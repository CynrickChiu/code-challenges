class Image

  attr_accessor :rows

  def initialize(rows)
    self.rows = rows
  end

  def output_image
    self.rows.each do |row|
      row.each do |element|
        print "#{element} "
      end

      puts
    end
  end

  def blur
    # store indices of every 1s in pixels_indices
    rows.each_with_index do |row, row_index|
      blur_row_by_index(row_index)
    end
  end

  def blur_distance(n)
    until n == 0 do
      blur
      n -= 1
    end
  end

  private

  def blur_row_by_index(row_index)
    rows[row_index].each_with_index do |element, pixel_index|
      blur_pixel(row_index, pixel_index)
    end
  end

  def blur_pixel(row_index, pixel_index)
    if rows[row_index][pixel_index] == 1
      # change pixel to the top
      rows[row_index - 1][pixel_index] = 1 unless (row_index - 1) < 0
      # change pixel to the bottom
      rows[row_index + 1][pixel_index] = 1 unless (row_index + 1) >= rows.size
      # change pixel to the left
      rows[row_index][pixel_index - 1] = 1 unless (pixel_index - 1) < 0
      # change pixel to the right
      rows[row_index][pixel_index + 1] = 1 unless (pixel_index + 1) >= rows[0].size
    end
  end

end

image1 = Image.new([
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1]
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
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
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
