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
#  product_id       :bigint
#
# Indexes
#
#  index_reviews_on_owner_id    (owner_id)
#  index_reviews_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#  fk_rails_...  (product_id => products.id)
#
class Review < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :product
  has_many :media

  # Enumerating list of values to be stored in columns
  enum visibility: { private: "private", followers_only: "followers only", public: "public" }
  enum would_repurchase: { yes: "yes", maybe: "maybe", no: "no" }
end
