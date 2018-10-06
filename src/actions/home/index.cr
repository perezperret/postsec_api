class Home::Index < ApiAction
  get "/" do
    json({
      hello: "Learn more by going to https://github.com/perezperret/postsec_api#postsecapi"
    })
  end
end
