# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.find_or_initialize_by(email: "afzal@gmail.com")
user.update!(
  password: "password",
  password_confirmation: "password"
)

if BlogPost.count < 30
  50.times do |i|
    blog_posts = BlogPost.where(title: "Blog Post #{i}").first_or_initialize
    blog_posts.update!(
      content: "This is the content for Blog Post #{i}",
      published_at: i % 7 != 0 ? Time.current : nil
    )
  end
end