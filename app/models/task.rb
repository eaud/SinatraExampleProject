class Task < ActiveRecord::Base
  belongs_to :doer
  before_save :set_slug

  def self.find_by_slug(slug)
    self.find_by(slug: slug)
  end

  private
  def set_slug
    self.slug = self.title.slugify
  end
end
