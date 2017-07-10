class Hotel < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :destination

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true
  validates :address, presence: true
  validates :review, presence: true
end
