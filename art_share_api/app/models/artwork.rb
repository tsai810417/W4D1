class Artwork < ApplicationRecord
  validates :title, presence: true, uniqueness: {
    scope: :artist_id,
    message: "A single user cannot have two artworks with the same title"
  }
  validates :image_url, presence: true, uniqueness: true

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: User
end
