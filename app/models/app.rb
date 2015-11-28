class App < ActiveRecord::Base
  has_many :urls, dependent: :destroy
  has_many :images, dependent: :destroy
end
