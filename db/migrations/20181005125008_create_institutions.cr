class CreateInstitutions::V20181005125008 < LuckyMigrator::Migration::V1
  def migrate
    create :institutions do
      add ipeds_id : String, index: true, unique: true
      add name : String, index: true
    end
  end

  def rollback
    drop :institutions
  end
end
