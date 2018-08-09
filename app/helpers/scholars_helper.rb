module ScholarsHelper

  def setup_scholar(scholar)
    scholar.tap do |s|
      s.build_publication_urls
      s.build_personal_urls
      s.build_organisation if s.organisation.blank?
    end
  end

end
