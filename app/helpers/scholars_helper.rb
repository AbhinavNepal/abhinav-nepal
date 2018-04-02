module ScholarsHelper

  def setup_scholar(scholar)
    scholar.tap do |s|
      s.web_urls.build(code: :publication) if s.web_urls.select(&:publication?).blank?
      s.web_urls.build(code: :personal) if s.web_urls.select(&:personal?).blank?
      s.build_organisation if s.organisation.blank?
    end
  end

end
