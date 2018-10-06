class Institutions::Index < ApiAction
  before set_cors_header

  param page : Int32 = 1
  param per_page : Int32 = 20
  param search : String?

  route do
    institutions = InstitutionQuery.new
      .limit(per_page)
      .offset((page - 1) * per_page)

    unless search.nil? || search.try(&.empty?)
      puts search
      institutions = institutions.name.ilike("%#{search}%")
    end

    total = InstitutionQuery.new.count

    json Institutions::IndexSerializer.new(institutions, total, page, per_page)
  end
end
