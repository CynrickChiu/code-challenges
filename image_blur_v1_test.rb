require 'minitest/autorun'
require_relative 'image_blur_v1'

class TestImageBlur < Minitest::Test
  def setup
    @image1 = Image.new([
      [0, 1, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 1]
    ])
  end

  def test_different_object_id
    refute_same @image1.rows.object_id, @image1.copy.object_id
  end

  def test_output_image
    assert_output("0 1 0 0 \n0 0 0 0 \n0 1 0 0 \n0 0 0 1 \n") { @image1.output_image }
  end

  def test_blur
  	@image1.blur
    assert_equal [[1, 1, 1, 0], [0, 1, 0, 0], [1, 1, 1, 1], [0, 1, 1, 1]], @image1.rows
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

  def test_blur_row_by_index
    @image1.send(:blur_row_by_index, 3)
    assert_equal [0, 0, 1, 1], @image1.rows[3]
  end

  def test_blur_pixel
    @image1.send(:blur_pixel, 2, 1)
    assert_equal [1, 1, 1, 0], @image1.rows[2]
  end
end