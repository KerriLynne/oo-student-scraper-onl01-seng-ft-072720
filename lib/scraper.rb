require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)  #is a class method that scrapes the student index page ('./fixtures/student-site/index.html') and a returns an array of hashes in which each hash represents one student
    html = open(index_url)  # use Nokogiri and Open-URI to access that page.
    doc = Nokogiri::HTML(html)
    student_info = doc.css(".student-card a")
    student_info.collect do |element|  #The return value of this method should be an array of hashes in which each hash represents a single student.
      {:name => element.css(".student-name").text,
        :location => element.css(".student-location").text,
        :profile_url => element.attr("href")
      }
    end
  end

  def self.scrape_profile_page(profile_url)  #his is a class method that should take in an argument of a student's profile URL.
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    student_profile = {}   #The return value of this method should be a hash in which the key/value pairs describe an individual student

      social = doc.css(".vitals-container .social-icon-container a")
      social.each do |element|
        if element.attr("href").include?("twitter")
          student_profile[:twitter] = element.attr("href")
        elsif element.attr("href").include?("linkedin")
          student_profile[:linkedin] = element.attr("href")
        elsif element.attr("href").include?("github")
          student_profile[:github] = element.attr("href")
        elsif element.attr("href").include?("blog")
          student_profile[:blog] = element.attr("href")
        end
      end
      student_profile[:profile_quote] = doc.css(".vitals-container .vitals-text-containter .profile-quote")



  end

end
