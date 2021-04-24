class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :role_models, through: :tag_maps
  validates :name, uniqueness: true

  scope :by_name_like, lambda { |tag|
    where('name LIKE :value', { value: "#{sanitize_sql_like(tag)}%" })
  }
end
