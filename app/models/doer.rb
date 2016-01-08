class Doer < ActiveRecord::Base
  has_many :tasks
  before_save :set_slug

  def self.find_by_slug(slug)
    self.find_by(slug: slug)
  end

  private
  def set_slug
    self.slug = self.name.slugify
  end
end
