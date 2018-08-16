class Picture < ApplicationRecord

  validates :title, length: {within:3..20}
  validates :artist, :url, presence: true
  validates :url, uniqueness: true

  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def self.created_in_year(time)
    Picture.where("created_at < ?", time)
  end
end
