class Image
  attr_accessor :rows

  def initialize(rows)
    self.rows = rows
  end

  def output_image
    self.rows.each do |row|
      row.each do |element|
        print element
      end

      puts
    end
  end

  def blur
    pixels_indices = []
    total_rows = self.rows.size         # total number of rows of image
    total_elements = self.rows[0].size  # total number of elements per row of image

    # store indices of every 1s in pixels_indices
    self.rows.each_with_index do |row, row_index|
      row.each_with_index do |element, pixel_index|
        if element == 1
          pixels_indices << [row_index, pixel_index]
        end
      end
    end

    pixels_indices.each do |item|
      row = item[0]
      index = item[1]
      
      self.rows[row - 1][index] = 1 unless (row - 1) < 0
      self.rows[row + 1][index] = 1 unless (row + 1) >= total_rows
      self.rows[row][index - 1] = 1 unless (index - 1) < 0
      self.rows[row][index + 1] = 1 unless (index + 1) >= total_elements
    end
  end
end

image = Image.new([
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1]
])

puts 'Original image:'
image.output_image

puts
image.blur

puts 'Image after running blur method:'
image.output_image