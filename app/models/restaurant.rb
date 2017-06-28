class Restaurant < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :destination

  validates :name, presence: true
  validates :address, presence: true
  validates :review, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


end
