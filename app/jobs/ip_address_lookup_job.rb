# frozen_string_literal: true

class IpAddressLookupJob < ApplicationJob
  def perform(request_id)
    request = WebRequest.find_by(id: request_id)

    return if request.nil?

    access_token = Rails.application.credentials.ipinfo_token
    handler = IPinfo.create(access_token)
    details = handler.details(request.original_remote_ip)
    cf_details = handler.details(request.remote_ip)

    country = details.country_name
    city = details.city
    cf_edge_location = cf_details.city

    request.update(country: country, city: city, cf_edge_location: cf_edge_location)
  end
end
