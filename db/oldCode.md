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