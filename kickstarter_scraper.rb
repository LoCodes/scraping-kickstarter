# require libraries/modules here
require 'nokogiri'
require 'pry'



# Each project has a title, an image, a short description, 
#   a location, and some funding details. 

# note to self
# projects: kickstarter.css("li.project.grid_4")
  # project = _     #=>  will assign the variable name to the return value of whatever was executed above.
# title: project.css("h2.bbcard_name strong a").text
#image link: project.css("div.project-thumbnail a img").attribute("src").value 
#description: project.css("p.bbcard_blurb").text 
#location: project.css("ul.project-meta li span.location-name").text      #li not included on notes 
#percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i



def create_project_hash
  # write your code here
  # This just opens a file and reads it into a variable
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html) 
  

  projects = {}

  # Iterate through the projects
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {

      image_link: project.css("div.project-thumbnail a img").attribute("src").value,
      description: project.css("p.bbcard_blurb").text, 
      location: project.css("ul.project-meta li span.location-name").text,      #li not included on notes  but works
      percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
      
    }
  end

  # return the projects hash
  projects
end 


#puts create_project_hash.to_a[0]