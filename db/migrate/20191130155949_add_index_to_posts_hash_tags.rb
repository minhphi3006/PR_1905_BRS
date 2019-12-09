class AddIndexToPostsHashTags < ActiveRecord::Migration[5.2]
  def change
    add_index :posts_hash_tags, :post_id
    add_index :posts_hash_tags, :hash_tag_id
  end
end
