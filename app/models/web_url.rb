class WebUrl < ApplicationRecord

  extend Enumerize

  belongs_to :linkable, polymorphic: true, optional: true

  validates :title, :url, presence: true
  validates :url, url: {message: I18n.t("url.invalid", scope: "activerecord.errors.models.web_urls.attributes")}

  enumerize :code, in: [:publication, :personal], predicates: true

end
