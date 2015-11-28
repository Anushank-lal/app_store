class Url < ActiveRecord::Base
  belongs_to :app

  scope :active_urls, -> { where(status: true) }
end
