require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    student_info = doc.css(".student-card a")
    student_info.collect do |element|
      {:name => element.css(".student-name").text, 
      :location => element.css("student-location").text, 
      :profile_url => element.attr("href")
    }

  end

  def self.scrape_profile_page(profile_url)

  end

end
