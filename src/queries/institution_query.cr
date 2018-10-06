class InstitutionQuery < Institution::BaseQuery
  def search(query : String?)
    return self if query.nil? || query.try(&.empty?)
    name.ilike("%#{query}%")
  end

  def paginate(page : Int32, per_page : Int32)
    limit(per_page).offset((page - 1) * per_page)
  end
end
