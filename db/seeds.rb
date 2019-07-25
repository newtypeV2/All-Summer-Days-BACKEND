# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
classURL = "http://www.dnd5eapi.co/api/classes"
proficienciesURL = "http://www.dnd5eapi.co/api/proficiencies"



response = RestClient.get(proficienciesURL)
proficiencies = JSON.parse(response)
proficiencies["results"].filter do |prof| 
    !(prof["name"].include?("Skill:") || prof["name"].include?("Saving Throw:"))
end.map {|prof| Proficiency.find_or_create_by(name: prof["name"])}

response = RestClient.get(classURL)
classesHash = JSON.parse(response)
classesHash["results"].map do |c| CharClass.find_or_create_by(name: c["name"]) end

    classesHash["results"].map do |c| 
        ccid=CharClass.find_or_create_by(name: c["name"]).id
        JSON.parse(RestClient.get(c["url"]))["proficiencies"].map do |prof|
            profid = Proficiency.find_by(name: prof["name"]).id
            CharClassProficiency.find_or_create_by(char_class_id: ccid , proficiency_id: profid)

        end
    end


binding.pry