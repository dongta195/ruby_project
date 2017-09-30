class ZipcodesController < ApplicationController
  def index
    render json: get_data
  end

  private
  def get_data
    if params["zipcode"].present?
      Terminal::Geocoder.new(params["zipcode"]).search_addresses
    else
      Terminal::Geocoder.new("prefecture" => params["prefecture"],
        "city" => params["city"],
        "town" => params["town"]).search_zipcode
    end
  end
end
