class MediaLink < ApplicationRecord
  has_many :pets_media_links
  has_many :pets, through: :pets_media_links
  belongs_to :user
end
