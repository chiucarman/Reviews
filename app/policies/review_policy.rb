class ReviewPolicy
  attr_reader :user, :review

  def initialize(user, review)
    @user = user
    @review = review
  end

  # Our policy is that a photo should only be seen by the owner or followers
  #   of the owner, unless the owner is not private in which case anyone can
  #   see it
  def show?
    user == review.owner ||
      !(review.visibility == 'only_me') ||
      review.owner.followers.include?(user) ||
      review.visibility == 'everyone'
  end
end
