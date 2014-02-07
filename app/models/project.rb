class Project < ActiveRecord::Base
  # http_basic_authenticate_with :name => "frodo", :password => "thering"

  attr_accessible :date, :description, :image, :link, :video,
                  :title, :technologies, :crop_x, :crop_y, 
                  :crop_w, :crop_h

  default_scope order('date DESC')
  
  serialize :technologies

  mount_uploader :image, ImageUploader

  # Class instance variables

  @tech = %w(HTML5 CSS3 Rails JavaScript SSL Google_Maps_API Illustrator Photoshop ActionScript_3)
  
  class << self
  	attr_accessor :tech
  end

  # End of class instance variables


  # Jcrop
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  after_update :crop_image

  def crop_image
    image.recreate_versions! if crop_x.present?
  end

end
