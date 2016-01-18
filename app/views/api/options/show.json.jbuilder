json.currentUser do 
  json.id @user.id
  json.subjects @user.subjects do |subject|
    json.id subject.id
    json.title subject.name
  end
end

json.options @user.options do |option|
  json.id option.id
  json.subject option.subject.name
  json.deliveryHour option.readable_time
  json.deliveryDay option.readable_weekday
  json.deliveryInterval option.delivery_interval
  json.deliveryMethod option.delivery_method
end