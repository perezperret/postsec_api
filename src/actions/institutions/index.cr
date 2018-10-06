class Institutions::Index < ApiAction
  before set_cors_header

  param page : Int32 = 1
  param per_page : Int32 = 20
  param query : String?

  route do
    institutions = InstitutionQuery.new
      .search(query)
      .paginate(page, per_page)

    json Institutions::IndexSerializer.new(institutions, page, per_page)
  end
end
