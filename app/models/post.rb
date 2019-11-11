class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validate :image_presence

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

  scope :posts_on_timeline, ->(following, me){
    where("user_id IN (?) or user_id = (?)", following, me.id).order(id: :desc)
  }
end
