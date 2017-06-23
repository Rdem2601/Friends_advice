class Activity < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :destination

  validates :name, presence: true
  validates :address, presence: true
  validates :review, presence: true
end
