json.tags @tags do |tag|
  json.title tag.title
  json.confirmed tag.confirmed?
  json.tagId tag.id
end