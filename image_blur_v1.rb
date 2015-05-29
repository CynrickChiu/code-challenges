# blur version 1

class Image

  attr_accessor :rows, :copy

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
    create_copy
    copy.each_with_index do |row, row_index|
      blur_row_by_index(row_index)
    end
  end

  def blur_distance(distance)
    until distance == 0 do
      blur
      distance -= 1
    end
  end

  private

  def create_copy
    @copy = Marshal.load(Marshal.dump(rows))
  end

  def blur_row_by_index(row_index)
    copy[row_index].each_with_index do |element, pixel_index|
      blur_pixel(element, row_index, pixel_index)
    end
  end

  def blur_pixel(element, row_index, pixel_index)
    if element == 1
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