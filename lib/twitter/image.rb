# lib/twitter/image.rb
module Twitter::Image
  # The Twitter gem is particular about the type of IO object it
  #   recieves when tweeting an image. If an image is < 10kb, Ruby opens it as a
  #   StringIO object. Which is not supported by the Twitter gem/api.
  #
  #   This method ensures we always have a valid IO object for Twitter.
  def self.open_from_url(image_url)
    image_file = open(image_url)
    return image_file unless image_file.is_a?(StringIO)

    file_name = File.basename(image_url)

    temp_file = Tempfile.new(file_name)
    temp_file.binmode
    temp_file.write(image_file.read)
    temp_file.close

    open(temp_file.path)
  end
end