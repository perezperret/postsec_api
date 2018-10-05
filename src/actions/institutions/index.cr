class Institutions::Index < ApiAction
  param page : Int32 = 1
  param per_page : Int32 = 20

  route do
    institutions = InstitutionQuery.new
    total = InstitutionQuery.new.count

    json Institutions::IndexSerializer.new(institutions, total, page, per_page)
  end
end
