class Terminal::Geocoder
  def initialize params
    Geocoder.configure language: :ja
    @params = params
  end

  def search_zipcode
    address = Geocoder.search get_search_terms_from(params)
    return {} unless address.present?
    @address_components = address.first.address_components
    {zipcode: get_address_item_by(["postal_code"]).try(:[], "long_name")}
  end

  def search_addresses
    address = Geocoder.search postal_code: params
    return {} unless address.present?
    @address_components = address.first.address_components
    nation = get_address_item_by(%w(country political))
      .try(:[], "long_name")
    return {} unless nation != I18n.t("create_brand.japan")
    {
      prefecture: get_address_item_by(%w(administrative_area_level_1
        political)).try(:[], "long_name"),
      city: get_address_item_by(%w(locality political)).try(:[], "long_name"),
      town: get_address_item_by(%w(political sublocality
        sublocality_level_1)).try(:[], "long_name")
    }
  end

  private
  attr_reader :params

  def get_address_item_by types
    @address_components.find{|entry| entry["types"] == types}
  end

  def get_search_terms_from params
    "#{I18n.t('create_brand.japan')}#{params['prefecture']}#{params['city']}" \
      "#{params['town']}"
  end
end
