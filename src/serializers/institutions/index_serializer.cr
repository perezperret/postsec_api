class Institutions::IndexSerializer < Lucky::Serializer
  def initialize(@institutions : InstitutionQuery, @total : Int64, @page : Int32, @per_page : Int32)
  end

  def render
    {
      institutions: @institutions.map { |institution| ShowSerializer.new(institution) },
      page: @page,
      per_page: @per_page,
      total: @total
    }
  end
end
