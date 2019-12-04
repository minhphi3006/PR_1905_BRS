class PostsHashTags < ApplicationRecord
  belongs_to :post, class_name: "Post"
  belongs_to :hash_tag, class_name: "HashTag"
end
