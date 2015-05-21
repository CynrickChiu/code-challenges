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
    elements_per_row = self.rows[0].size
    flattened = self.rows.flatten
    #puts flattened.inspect

    if distance == 1
      flattened.each_index do |index|
        if flattened[index] == 1
          # change pixel to the left
          flattened[index - 1] = 1 unless (index - 1) < 0

          # change pixel to the right
          #flattened[index + 1] = 1 unless (index + 1) >= flattened.size

          # change pixel to the top
          flattened[index - elements_per_row] = 1 unless (index - elements_per_row) < 0

          # change pixel to the bottom
          #flattened[index + elements_per_row] = 1 unless (index + elements_per_row) >= flattened.size
        end
      end

      result = []

      until flattened.empty? do
        result << flattened.shift(elements_per_row)
        #puts result.inspect
      end

      #puts "result => #{result.inspect}"
      self.rows = result
    end
  end

end

image1 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0]
])

puts 'Original image #1:'
image1.output_image
puts
image1.blur(1)
puts 'Image #1 after running blur method:'
image1.output_image