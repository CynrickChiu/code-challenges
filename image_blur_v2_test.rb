require 'minitest/autorun'
require_relative 'image_blur_v2'

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

  def test_blur
    @image1.blur(1)
    assert_equal [[1, 1, 1, 0], [0, 1, 0, 0], [1, 1, 1, 1], [0, 1, 1, 1]], @image1.rows

    @image2 = Image.new([
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 1]
    ])

    @image2.blur(2)
    assert_equal [[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 1, 1, 1, 0, 0, 0, 0], 
                  [0, 1, 1, 1, 1, 1, 0, 0, 1], [0, 0, 1, 1, 1, 0, 0, 1, 1], [0, 0, 0, 1, 0, 0, 1, 1, 1]], @image2.rows
  end

  def test_find_pixels
    assert_equal [[0, 1], [2, 1], [3, 3]], @image1.send(:find_pixels)
  end

  def test_blur_pixel
    @image1.send(:blur_pixel, 2, 1)
    assert_equal [0, 1, 0, 0], @image1.rows[1]
    assert_equal [1, 1, 1, 0], @image1.rows[2]
    assert_equal [0, 1, 0, 1], @image1.rows[3]
  end
end