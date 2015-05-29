require 'minitest/autorun'
require_relative 'image_blur_v3'

class TestImageBlur < Minitest::Test
  def setup
    @image1 = Image.new([
      [0, 1, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 1]
    ])
  end

  def test_output_image
    assert_output("0 1 0 0 \n0 0 0 0 \n0 1 0 0 \n0 0 0 1 \n") { @image1.output_image }
  end

  def test_blur_with_pixel_change
    @image1.blur
    assert_equal [[1, 1, 1, 0], [0, 1, 0, 0], [1, 1, 1, 1], [0, 1, 1, 1]], @image1.rows
  end

  def test_blur_without_pixel_change
    @image2 = Image.new([[0, 0, 0, 0], [0, 0, 0, 0]])
    assert_equal [[0, 0, 0, 0], [0, 0, 0, 0]], @image2.rows
  end

  def test_blur_distance
    @image2 = Image.new([
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 1]
    ])

    @image2.blur_distance(2)
    assert_equal [[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 1, 1, 1, 0, 0, 0, 0], 
                  [0, 1, 1, 1, 1, 1, 0, 0, 1], [0, 0, 1, 1, 1, 0, 0, 1, 1], [0, 0, 0, 1, 0, 0, 1, 1, 1]], @image2.rows
  end
end