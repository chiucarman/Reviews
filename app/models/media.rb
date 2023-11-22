# == Schema Information
#
# Table name: media
#
#  id         :bigint           not null, primary key
#  file       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  review_id  :bigint           not null
#
# Indexes
#
#  index_media_on_review_id  (review_id)
#
# Foreign Keys
#
#  fk_rails_...  (review_id => reviews.id)
#
class Media < ApplicationRecord
  belongs_to :review
end
