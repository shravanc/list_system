class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.integer?(params)
    return true if params.class == Integer
    !!(params =~ /\A[-+]?[0-9]+\z/) if params.class == String
  end

  def self.find uniq_id
    if integer?(uniq_id)
      super
    else
      find_by(slug: uniq_id)
    end
  end

  def generate_slug string, index
    return string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') if index == 0
    string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') + "-#{index}"
  end

  def set_slug
    index = 0
    loop do
      self.slug = generate_slug self.title, index
      break unless self.class.where(slug: slug).exists?
      index += 1
    end
  end
end
