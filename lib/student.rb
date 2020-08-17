class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    self.send("name=", student_hash[:name])  #takes in an argument of a hash and sets that new student's attributes using the key/value pairs of that hash
    self.send("location=", student_hash[:location])
    self.send("profile_url=", student_hash[:profile_url])
    @@all << self  #  adds that new student to the Student class' collection of all existing students, stored in the `@@all` class variable.

  end

  def self.create_from_collection(students_array)
    students_array.each do |student_hash|
      Student.new(student_hash)

  end

  def add_student_attributes(attributes_hash)

  end

  def self.all

  end
end
