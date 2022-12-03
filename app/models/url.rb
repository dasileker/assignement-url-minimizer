class Url < ApplicationRecord
  validates :long_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: false
  validates :short_code, uniqueness: true, allow_blank: false
  has_many :analitics, dependent: :destroy

  before_validation :generate_short_code, :sanitize

  def sanitize
    long_url.strip!
    self.long_url = long_url.downcase
    true
  end

  def generate_short_code
    short_code = SecureRandom.uuid[0..5]
    if Url.find_by(short_code: short_code).nil?
      self.short_code = short_code
      true
    else
      generate_short_code
    end
  end

  def short_url
    Rails.application.routes.url_helpers.redirect_url(shortcode: short_code, host: 'localhost', port: 3000)
  end
end
