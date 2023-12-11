# == Schema Information
#
# Table name: media
#
#  id         :bigint           not null, primary key
#  file       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint           not null
#  review_id  :bigint           not null
#
# Indexes
#
#  index_media_on_owner_id   (owner_id)
#  index_media_on_review_id  (review_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#  fk_rails_...  (review_id => reviews.id)
#
class Media < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :review
  belongs_to :owner, class_name: "User"

  include Ransackable
end
