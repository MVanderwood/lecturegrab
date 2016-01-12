json.currentUser do
  json.id @current_user_id
  json.role @current_user_role
end

json.discussion do
  json.userId @discussion.owner_id
  json.userHandle @discussion.owner.handle
  json.title @discussion.title
  json.content @discussion.content
end

json.posts @posts do |post|
  json.userId post.user_id
  json.userHandle post.user.handle
  json.content post.content
end