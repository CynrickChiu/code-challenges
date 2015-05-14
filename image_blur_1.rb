class Image
  attr_accessor :arrays

  def initialize(arrays)
    @arrays = arrays
  end

  def output_image
    @arrays.each do |array|
      array.size.times do |i|
        print array[i]
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