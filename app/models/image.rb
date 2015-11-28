class Image < ActiveRecord::Base
  belongs_to :app

  scope :active_images, -> { where(status: true) }
end
