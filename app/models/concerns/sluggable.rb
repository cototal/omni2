module Sluggable
  extend ActiveSupport::Concern

  included do
    before_save :make_slug
  end

  def make_slug
    self.slug = name.parameterize
  end
end