class HashTag < ApplicationRecord
  has_many :hash_tag_posts, class_name: "PostsHashTags",
                            foreign_key: "hash_tag_id"
  has_many :posts, through: :hash_tag_posts, source: :post
end
