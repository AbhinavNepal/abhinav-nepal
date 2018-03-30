module ScholarsHelper

  def setup_scholar(scholar)
    scholar.tap do |s|
      s.web_urls.build if s.web_urls.blank?
      s.build_organisation if s.organisation.blank?
    end
  end

end
