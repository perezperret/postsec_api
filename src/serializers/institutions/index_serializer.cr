class Institutions::IndexSerializer < Lucky::Serializer
  def initialize(@institutions : InstitutionQuery, @page : Int32, @per_page : Int32)
  end

  def render
    {
      institutions: @institutions.map { |institution| ShowSerializer.new(institution) },
      page: @page,
      per_page: @per_page
    }
  end
end
