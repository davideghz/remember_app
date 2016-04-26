json.users @users do |user|
  json.id               user.id
  json.name             user.name
  json.email            user.email
  json.url              user_url(user)
  json.tot_vehicles     user.vehicles.count

  json.vehicles         user.vehicles, :id, :name, :matriculation_date

end