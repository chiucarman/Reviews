class ReviewPolicy < ApplicationPolicy
  attr_reader :user, :review

  def initialize(user, review)
    @user = user
    @review = review
  end

  # Our policy is that a photo should only be seen by the owner or followers
  #   of the owner, unless the owner is not private in which case anyone can
  #   see it

  def show?
    # show if the user is the owner
    user == review.owner ||
    # or if the review is not set to only me and user is following review's owner
      (review.visibility != 'only_me' && review.owner.followers.include?(user)) ||
      # or if the review's visibility is everyone
      review.visibility == 'everyone'
  end
end
