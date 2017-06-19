class Activity < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :destination

  validates :name, presence: true
  validates :address, presence: true
  validates :review, presence: true
end
