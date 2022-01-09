json.array! @avengers do |avenger|
    json.extract! avenger,
    :id, 
    :superhero_name,
    :real_name,
    :age,
    :description,
    :status
  end