json.currentUser do 
  json.id @user.id
end

json.options @user.options do |option|
  json.subject option.subject.name
  json.deliveryTime option.delivery_time
  json.deliveryInterval option.delivery_interval
  json.deliveryMethod option.delivery_method
end