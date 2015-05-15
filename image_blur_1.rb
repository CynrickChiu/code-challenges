class Image
  attr_accessor :rows

  def initialize(rows)
    self.rows = rows
  end

  def output_image
    self.rows.each do |rows|
      rows.each do |element|
        print element
      end

      puts
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image