class Destination < ApplicationRecord
  belongs_to :user
  has_many :restaurants, dependent: :destroy
  has_many :hotels, dependent: :destroy
  has_many :activities, dependent: :destroy

  validates :name, presence: true
  validates :date, presence: true


end
