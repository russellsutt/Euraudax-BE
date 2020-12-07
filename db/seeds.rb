require 'rest-client'

User.destroy_all
Route.destroy_all
Comment.destroy_all
Event.destroy_all
Attendee.destroy_all


strava_id = 8049727

athlete_rq = RestClient.get('https://www.strava.com/api/v3/athlete', headers = { Authorization: "Bearer #{ENV['STRAVA_API_KEY']}"})
athlete_parse = JSON.parse(athlete_rq)

russell = User.create!(
    username: 'russell.sutter@gmail.com', 
    password: '123',
    firstname: athlete_parse['firstname'],
    lastname: athlete_parse['lastname'],
    city: athlete_parse['city'],
    state: athlete_parse['state'],
    bio: 'Just a boy and his bikes.',
    pic: athlete_parse['profile_medium']
    )


routes_rq = RestClient.get("https://www.strava.com/api/v3/athletes/#{strava_id}/routes", headers = { Authorization: "Bearer #{ENV['STRAVA_API_KEY']}"})
routes = JSON.parse(routes_rq)

array = [2756677894334996404, 2756677211135749776, 2756679595368166032]

nyc_routes = routes[0..7]

nyc_routes.each { |route|
    if array.include?(route['id'])
       Route.create!(
       title: route['name'],
       description: route['description'],
       distance: route['distance'].to_i,
       elevation: route['elevation_gain'].to_i,
       estimated_time: route['estimated_moving_time'].to_i,
       polyline: route['map']['summary_polyline'],
       user: russell
       )
    else
    Route.create!(
       title: route['name'],
       description: route['description'],
       distance: route['distance'].to_i,
       elevation: route['elevation_gain'].to_i,
       estimated_time: route['estimated_moving_time'].to_i,
       polyline: route['map']['summary_polyline'],
       user: nil,
       )
    end
}