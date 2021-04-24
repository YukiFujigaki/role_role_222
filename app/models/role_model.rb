class RoleModel < ApplicationRecord
  belongs_to :user
  has_many :tag_maps, dependent: :destroy, foreign_key: 'role_model_id'
  has_many :tags, through: :tag_maps

  class << self
    def all_role_models(page, per)
      self.all.order(created_at: :desc).page(page).per(per)
    end
  end

  def save_tags(save_tags)
    current_tags = self.tags.pluck(:name) if self.tags
    old_tags = current_tags - save_tags
    new_tags = save_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete(Tag.find_by(name: old_name))
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name: new_name)
      self.tags << post_tag
    end
  end
end
