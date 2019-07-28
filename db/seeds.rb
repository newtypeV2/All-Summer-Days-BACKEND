# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
classURL = "http://www.dnd5eapi.co/api/classes"
proficienciesURL = "http://www.dnd5eapi.co/api/proficiencies"
skillsURL = "http://www.dnd5eapi.co/api/skills"

response = RestClient.get(proficienciesURL)
proficiencies = JSON.parse(response)
proficiencies["results"].map do |prof| 
    Proficiency.find_or_create_by(name: prof["name"])
end


skillsHash = JSON.parse(RestClient.get(skillsURL))["results"].map do |skill|
    Skill.find_or_create_by(name: skill["name"])
end

response = RestClient.get(classURL)
classesHash = JSON.parse(response)
classesHash["results"].map do |c| 
    newClass = CharClass.find_or_create_by(name: c["name"], hit_die: JSON.parse(RestClient.get(c["url"]))["hit_die"])
    ccid= newClass.id
            JSON.parse(RestClient.get(c["url"]))["proficiencies"].map do |prof|
                profid = Proficiency.find_by(name: prof["name"]).id
                CharClassProficiency.find_or_create_by(char_class_id: ccid , proficiency_id: profid)
            end
            JSON.parse(RestClient.get(c["url"]))["saving_throws"].map do |st|
                profid=Proficiency.where("name like ?","%#{st["name"]}%").first.id
                CharClassProficiency.find_or_create_by(char_class_id: ccid , proficiency_id: profid)
            end
            if (ccid==2)
                    JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][0]["from"].map do |profc|
                        skillid=Proficiency.find_by(name: profc["name"]).id
                        CharClassProficiency.find_or_create_by(char_class_id: ccid , proficiency_id: skillid)
                    end
                    newClass.proficiency_skill=JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][0]["choose"]
                    newClass.save
                    JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][1]["from"].map do |profc|
                        skillid=Proficiency.find_by(name: profc["name"]).id
                        CharClassProficiency.find_or_create_by(char_class_id: ccid , proficiency_id: skillid)
                    end
                    newClass.proficiency_instruments=JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][1]["choose"]
                    newClass.save
                    
            elsif (ccid==6)
                    JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][0]["from"].map do |profc|
                        skillid=Proficiency.find_by(name: profc["name"]).id
                        CharClassProficiency.find_or_create_by(char_class_id: ccid , proficiency_id: skillid)
                    end
                    newClass.proficiency_tools=JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][0]["choose"]
                    newClass.save
                    JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][1]["from"].map do |profc|
                        skillid=Proficiency.find_by(name: profc["name"]).id
                        CharClassProficiency.find_or_create_by(char_class_id: ccid , proficiency_id: skillid)
                    end
                    newClass.proficiency_instruments=JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][1]["choose"]
                    newClass.save
                    JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][2]["from"].map do |profc|
                        skillid=Proficiency.find_by(name: profc["name"]).id
                        CharClassProficiency.find_or_create_by(char_class_id: ccid , proficiency_id: skillid)
                    end
                    newClass.proficiency_skill=JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][2]["choose"]
                    newClass.save
            else
                    JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][0]["from"].map do |profc|
                        skillid=Proficiency.find_by(name: profc["name"]).id
                        CharClassProficiency.find_or_create_by(char_class_id: ccid , proficiency_id: skillid)
                    end
                    newClass.proficiency_skill=JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][0]["choose"]
                    newClass.save
            end
            
            #JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/classes/3"))["proficiency_choices"][0]["from"]
            # if ccid == 6
                
            #     JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][2]["from"].map do |profc|
            #         skillid=Skill.where("name like ?",profc["name"].split(": ").last).first.id
            #         CharClassSkill.find_or_create_by(char_class_id: ccid , skill_id: skillid)
            #     end
            # else
            #     JSON.parse(RestClient.get(c["url"]))["proficiency_choices"][0]["from"].map do |profc|
            #         skillid=Skill.where("name like ?",profc["name"].split(": ").last).first.id
            #         CharClassSkill.find_or_create_by(char_class_id: ccid , skill_id: skillid)
            #     end
            # end
    end

caleb = Character.find_or_create_by(
    firstname: "Caleb",
    lastname: "Widogast",
    char_class_id: CharClass.find_by(name: "Wizard").id,
    level: 2,
    strength: 10,
    dexterity: 12,
    constitution: 14,
    intelligence: 18,
    wisdom: 16,
    charisma: 16,
    hitpoints: 12,
    max_hp: 12,
    age: 33,
    height: 180,
    weight: 180,
    eyes: "blue",
    skin: "gray",
    hair: "brown",
    background: "Liam O'Brien's Boy",
    alignment: "True Neutral",
)

caleb.proficiency_ids = caleb.char_class.passive_proficiencies().map {|prof| prof[:id]} + caleb.char_class.saving_throws().map {|prof| prof[:id]} +
[Proficiency.find_by(name: "Skill: Arcana").id , Proficiency.find_by(name: "Skill: History").id]
# caleb.avatar.attach(io: File.open("./DND Sprites/wizard.gif"), filename: "wizard.gif", content_type: "image/gif")

drakthar = Character.find_or_create_by(
    firstname: "Drakthar",
    lastname: "BigClub",
    char_class_id: CharClass.find_by(name: "Barbarian").id,
    level: 2,
    strength: 16,
    dexterity: 11,
    constitution: 14,
    intelligence: 9,
    wisdom: 9,
    charisma: 5,
    hitpoints: 16,
    max_hp: 16,
    age: 25,
    height: 213,
    weight: 280,
    eyes: "blue",
    skin: "gray",
    hair: "brown",
    background: "Orphan From Clan",
    alignment: "Chaotic Neutral",
)

drakthar.proficiency_ids = drakthar.char_class.passive_proficiencies().map {|prof| prof[:id]} + drakthar.char_class.saving_throws().map {|prof| prof[:id]} +
[Proficiency.find_by(name: "Skill: Athletics").id , Proficiency.find_by(name: "Skill: Survival").id]
# drakthar.avatar.attach(io: File.open("./DND Sprites/barbarian.gif"), filename: "barbarian.gif", content_type: "image/gif")

Character.create({
    firstname: "Stasis", lastname: "Of Fis", char_class_id: 9, level: 2, strength: 12, dexterity: 18, constitution: 7, intelligence: 9, wisdom: 9, charisma: 15, hitpoints: 12, max_hp: 12, age: 29, height: 180, weight: 170, eyes: "brown", skin: "tan", hair: "brown",background: "Wanna be thug.",alignment: "Chaotic Neutral",proficiency_ids: [105,113,118,121,1,19,42,46,48,54,96,100,102]
    })

# character:
# {
# firstname: "Stasis", lastname: "Of Fis", char_class_id: 9, level: 2, strength: 12, dexterity: 18, constitution: 7, intelligence: 9, wisdom: 9, charisma: 15, hitpoints: 12, max_hp: 12, age: 29, height: 180, weight: 170, eyes: "brown", skin: "tan", hair: "brown",background: "Wanna be thug.",alignment: "Chaotic Neutral",proficiency_ids: [105,113,118,121,1,19,42,46,48,54,96,100,102]
# }