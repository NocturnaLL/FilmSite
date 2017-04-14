class Film < ApplicationRecord

  belongs_to :category
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :votes


  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_attached_file :video, :styles => {
    :medium => { :geometry => "640x480", :format => 'flv' },
    :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
  }, :processors => [:transcoder]



  validates_attachment_presence :video
  validates_attachment_content_type :video,
    :content_type => ['video/mp4'],
    :message => "Sorry, right now we only support MP4 video",
    :if => :is_type_of_video?
  validates_attachment_content_type :video,
     :content_type => ['image/png', 'image/jpeg', 'image/jpg', 'image/gif'],
     :message => "Different error message",
     :if => :is_type_of_image?
  has_attached_file :video



  protected
  def is_type_of_video?
    video.content_type =~ %r(video)
  end

  def is_type_of_image?
    video.content_type =~ %r(image)
  end

end
