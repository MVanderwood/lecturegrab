json.currentUser do
  json.id @current_user_id
  json.role @current_user_role
end

json.tags @tags do |tag|
  json.title tag.tag.title
  json.confirmed tag.confirmed?
  json.tagId tag.tag_id
end