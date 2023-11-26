desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  p "Creating sample data"

  if Rails.env.development?
    FollowRequest.destroy_all
    Media.destroy_all
    Product.destroy_all
    Review.destroy_all
    User.destroy_all
  end

  5.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    u = User.create(
      email: "#{first_name}@example.com",
      password: "password",
      username: "#{first_name}#{last_name}".downcase,
      first_name: first_name,
      last_name: last_name,
    )

    p u
  end

  p "There are now #{User.count} users."
  # user = User.first
  # user.reviews.create(body: "Hi", would_repurchase: "Yes")
end
