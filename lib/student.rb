class Student

    attr_accessor :name, :grade 
    attr_reader :id
    
  def initialize(name, grade, id=nil)
    @id = id
    @name = name
    @grade = grade
  end
 
  def self.create_table
    students =  <<-SQL 
      CREATE TABLE IF NOT EXISTS songs (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        grade TEXT
        )
        SQL
    DB[:conn].execute(students) 
  end
 
  def save
    students = <<-SQL
      INSERT INTO songs (name, album) 
      VALUES (?, ?)
    SQL
 
    DB[:conn].execute(students, self.name, self.grade)
 
  end
end
