class ImageUploader < CarrierWave::Uploader::Base

  #로컬 저장을 위해서 추가되어야 하는 라인 minimagick 사용 AWS 사용시 주석처리
  include CarrierWave::MiniMagick

  # image Resize
  # https://hcn1519.github.io/articles/2016-02/carrierwave
  # https://bluesh55.github.io/2017/11/07/carrierwave-resizing-options/
  version :detail do
    process :resize_to_fit => [800, 10000]
  end
  version :profile do
      process :resize_to_fill => [100, 100], :if => :horizontal? # 4:3비율, 이미지가 가로일 때
      process :resize_to_fill => [100, 100], :if => :vertical? # 4:3비율, 이미지가 세로일 때
  end
  version :main do
      process :resize_to_fill => [240, 180], :if => :horizontal? # 4:3비율, 이미지가 가로일 때
      process :resize_to_fill => [240, 180], :if => :vertical? # 4:3비율, 이미지가 세로일 때
  end

  def horizontal?(new_file)
    image = MiniMagick::Image.open(self.file.file)
    true if ((image[:height] < image[:width]) || (image[:height] == image[:width]))
  end
  def vertical?(new_file)
    image = MiniMagick::Image.open(self.file.file)
    true if image[:height] > image[:width]
  end

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:

  #로컬 저장을 위해 사용하는 'file' AWS 사용시 주석 처리
  storage :file

  #AWS 저장을 위해 사용하는 'fog' local 사용시 주석 처리
  #storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.

  # 업로드 시 허용 확장자
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
