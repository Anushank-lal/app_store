class Add < ActiveRecord::Base
  belongs_to :app
  scope :active_adds, -> { where(status: true) }
  scope :random_add, -> { active_adds.select(:id, :url, :image).shuffle.first }


end
