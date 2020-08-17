require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)  #is a class method that scrapes the student index page ('./fixtures/student-site/index.html') and a returns an array of hashes in which each hash represents one student
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    student_info = doc.css(".student-card a")
    student_info.collect do |element|
      {:name => element.css(".student-name").text,
        :location => element.css(".student-location").text,
        :profile_url => element.attr("href")
      }
    end
  end

  def self.scrape_profile_page(profile_url)

  end

end
