class Image

  def initialize (myImage)
    @myImage = myImage
  end

  def get_ones
    ones = []
    @myImage.each_with_index do |row, num_rows|
      row.each_with_index do |item, num_cols|
        if item == 1
          ones << [num_rows, num_cols]
        end
      end
    end
    ones
  end
  
  def blur(blur_distance)
    ones = get_ones

    @myImage.each_with_index do |row, num_rows|
      row.each_with_index do |item, num_cols|
        ones.each do |found_num_rows, found_num_cols|
          if manhattan_distance(num_cols, num_rows, found_num_cols, found_num_rows) <= blur_distance
            @myImage[num_rows][num_cols] = 1
          end
        end
      end
    end
  end

  def manhattan_distance (x1, y1, x2, y2)
    horizontal = (x2 - x1).abs
    vertical = (y2 - y1).abs
    horizontal + vertical
  end
  
  def output_image
    @myImage.each do |x|
      puts x.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 1, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 1]
])

# original image
image.output_image
puts '------'

# blurred image
image.blur(3)
image.output_image