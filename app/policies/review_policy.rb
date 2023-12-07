class ReviewPolicy
  attr_reader :user, :review

  def initialize(user, review)
    @user = user
    @review = review
  end
end
