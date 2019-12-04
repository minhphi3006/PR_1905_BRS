class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validate :image_presence
  has_many :likes, dependent: :destroy
  has_many :comments

  has_many :post_hash_tags, class_name: "PostsHashTags",
                            foreign_key: "post_id"
  has_many :hash_tags, through: :post_hash_tags, source: :hash_tag

  after_commit :create_hash_tags, on: :create

  def create_hash_tags
    extract_name_hash_tags.each do |name|
      hash_tags.create(name: name)
    end
  end

  def extract_name_hash_tags
    caption.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end
  
  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

  scope :posts_on_timeline, ->(following, me){
    where("user_id IN (?) or user_id = (?)", following, me.id).order(id: :desc)
  }
end
