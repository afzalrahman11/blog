require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blog posts" do
    # assert BlogPost.new(published_at: nil).draft?
    # blog_posts() is a method provided by the test_helper.rb file that connects the fixture data to the test

    assert blog_posts(:draft).draft?
  end

  test "draft? returns false for scheduled blog posts" do
    # refute BlogPost.new(published_at: 1.day.from_now).draft?
    refute blog_posts(:scheduled).draft?
  end

  test "draft? returns false for published blog posts" do
    refute blog_posts(:published).draft?
  end

  test "scheduled? returns true for scheduled blog posts" do
    assert blog_posts(:scheduled).scheduled?
  end

  test "scheduled? returns false for draft blog posts" do
    refute blog_posts(:draft).scheduled?
  end

  test "scheduled? returns false for published blog posts" do
    refute blog_posts(:published).scheduled?
  end

  test "published? returns true for published blog posts" do
    assert blog_posts(:published).published?
  end

  test "published? returns false for scheduled blog posts" do
    refute blog_posts(:scheduled).published?
  end

  test "published? returns false for draft blog posts" do
    refute blog_posts(:draft).published?
  end

  # we can also use the draft_blog_post method to create a new draft blog post
  # def draft_blog_post
  #   BlogPost.new(published_at: nil)
  # end
end
