# blur version 2

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

  def blur(distance)
    return if distance == 0

    pixels_indices = find_pixels

    pixels_indices.each do |set|
      blur_pixel(set[0], set[1])
    end
    
    blur(distance - 1)
  end

  private

  def find_pixels
    pixels_indices = []

    # store indices of every 1s in pixels_indices
    self.rows.each_with_index do |row, row_index|
      row.each_with_index do |element, pixel_index|
        if element == 1
          pixels_indices << [row_index, pixel_index]
        end
      end
    end

    pixels_indices
  end

  def blur_pixel(row_index, pixel_index)
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

=begin
image1 = Image.new([
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1]
])

puts 'Original image #1:'
image1.output_image
puts
image1.blur(1)
puts 'Image #1 after running blur(1):'
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
image2.blur(3)
puts 'Image #2 after running blur(3):'
image2.output_image
=end