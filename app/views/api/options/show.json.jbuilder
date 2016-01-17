json.currentUser do 
  json.id @user.id
  json.subjects @user.subjects do |subject|
    json.id subject.id
    json.title subject.name
  end
end

json.options @user.options do |option|
  json.subject option.subject.name
  json.deliveryTime option.delivery_time
  json.deliveryInterval option.delivery_interval
  json.deliveryMethod option.delivery_method
end