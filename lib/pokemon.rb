class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
      sql = <<-SQL
        INSERT INTO pokemon (name, type) VALUES (?, ?)
      SQL
   
      db.execute(sql, name, type)
  end
  
  def self.find(id, db)
      sql = <<-SQL
        SELECT * FROM pokemon WHERE id=?
      SQL
   
      new_pokemon = db.execute(sql, id)
      Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db)
  end
end
