json.vehicles @vehicles do |vehicle|
  json.id                 vehicle.id
  json.name               vehicle.name
  json.matriculation_date vehicle.matriculation_date
end