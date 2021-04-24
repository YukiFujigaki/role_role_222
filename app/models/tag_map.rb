class TagMap < ApplicationRecord
  belongs_to :role_model_record, optional: true
  belongs_to :tag
end
