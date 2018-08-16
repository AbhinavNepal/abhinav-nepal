module ScholarsHelper

  def setup_scholar(scholar)
    scholar.tap do |s|
      s.build_publication_urls
      s.build_personal_urls
      s.build_organisation if s.organisation.blank?
      s.build_created_by if s.created_by.blank?
    end
  end

end
