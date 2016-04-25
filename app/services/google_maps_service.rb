class GoogleMapsService

  def self.give_coordinates(address, type)

    if (address != "") and !address.nil?
      url = "http://maps.google.com/maps/api/geocode/json?address=#{address}"
      buffer = open(url).read
      result = JSON.parse(buffer)

      result["results"][0]["geometry"]["location"][type]
    else
      return "undefined"
    end

  end

end
