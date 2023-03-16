skip = 0
limit = 30
while skip <= 100
    url = "https://dummyjson.com/users?limit=#{limit}&skip=#{skip}"
    FetchUsersJob.perform_async(url)
    skip = skip + limit
end
