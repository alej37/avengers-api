json.array! @avengers do |avenger|
    json.extract! avenger, 
    :superhero_name,
    :real_name,
    :age,
    :description,
    :status
  end