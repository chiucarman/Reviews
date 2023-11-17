# == Schema Information
#
# Table name: reviews
#
#  id               :bigint           not null, primary key
#  body             :string
#  published        :boolean
#  rating           :integer
#  visibility       :string
#  would_repurchase :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  owner_id         :bigint           not null
#  product_id       :integer
#
# Indexes
#
#  index_reviews_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Review < ApplicationRecord
  belongs_to :owner, class_name: "User"
end
