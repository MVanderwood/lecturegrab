json.currentUser do
  json.id @current_user_id
  json.role @current_user_role
end

json.tags @lecture_tags do |lecture_tag|
  json.title lecture_tag.tag.title
  json.confirmed lecture_tag.confirmed?
  json.tagId lecture_tag.tag_id
end