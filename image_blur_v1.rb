# blur version 1

class Image

  attr_accessor :rows, :copy

  def initialize(rows)
    self.rows = rows
    self.copy = Marshal.load(Marshal.dump(rows))
  end

  def output_image
    # puts rows.object_id
    # puts copy.object_id
    rows.each do |row|
      row.each do |element|
        print "#{element} "
      end

      puts
    end
  end

  def blur
    copy.each_with_index do |row, row_index|
      blur_row_by_index(row_index)
    end
  end

  def blur_distance(distance)
    until distance == 0 do
      blur
      distance -= 1
      self.copy = Marshal.load(Marshal.dump(rows))
    end
  end

  private

  def blur_row_by_index(row_index)
    copy[row_index].each_with_index do |element, pixel_index|
      blur_pixel(row_index, pixel_index)
    end
  end

  def blur_pixel(row_index, pixel_index)
    if copy[row_index][pixel_index] == 1
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
=end