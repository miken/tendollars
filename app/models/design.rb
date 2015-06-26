class Design < ActiveRecord::Base
  validates :name, presence: true

  has_attached_file :image,
    :styles => { 
      :thumb => "x100",
      :medium => "x300"
      },
    :convert_options => {
      :medium => "-gravity center -extent 708x300+75 '#{Rails.root.join('public/old_ten_dollars.png')}' -composite"
    }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :less_than => 5.megabytes
end
