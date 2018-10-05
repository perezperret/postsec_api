class Institutions::ShowSerializer < Lucky::Serializer
  def initialize(@institution : Institution)
  end

  def render
    {
      ipeds_id: @institution.ipeds_id,
      name: @institution.name
    }
  end
end
