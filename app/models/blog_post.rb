class BlogPost < ApplicationRecord
  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true

  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_first, updated_at: :desc) }
  # order(published_at: :desc) in postgresql sort the null values first, to avoid this we can use arel_table
  # arel_table[:published_at].desc.nulls_last is equivalent to "published_at DESC NULLS LAST", here we changed it to
  #   sort draft posts first.
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end
