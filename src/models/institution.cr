class Institution < BaseModel
  table :institutions do
    column ipeds_id : String
    column name : String
  end
end
