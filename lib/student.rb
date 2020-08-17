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
    students_array.each do |student_hash|  #uses the Scraper class to create new students with the correct name and location.
      Student.new(student_hash)
    end
  end

  def add_student_attributes(attributes_hash)  #  uses the Scraper class to get a hash of a given students attributes and uses that hash to set additional attributes for that student.
    self.send("twitter=", attributes_hash[:twitter])
    self.send("linkedin=", attributes_hash[:linkedin])
    self.send("github=", attributes_hash[:github])
    self.send("blog=", attributes_hash[:blog])
    self.send("profile_quote=", attributes_hash[:profile_quote])
    self.send("bio=", attributes_hash[:bio])
  end

  def self.all  #  returns the class variable @@all
    @@all
  end
end
