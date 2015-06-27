class Design < ActiveRecord::Base
  validates :name, presence: true
  validates :image, presence: true

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  has_attached_file :image,
    :styles => { 
      :thumb => "100x100",
      :medium => "x300"
      },
    :convert_options => {
      :medium => "-gravity center -extent 708x300+60 '#{Rails.root.join('public/old_ten_dollars.png')}' -composite"
    }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :less_than => 5.megabytes

  def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end
end
