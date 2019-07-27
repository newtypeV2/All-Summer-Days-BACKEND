class CharClass < ApplicationRecord
    has_many :character
    has_many :char_class_proficiencies
    has_many :proficiencies, through: :char_class_proficiencies
    # has_many :char_class_skills
    # has_many :skills, through: :char_class_skills

    def passive_proficiencies
        self.proficiencies.filter do |prof|
            !(prof.name.include?("Skill")) && !(prof.name.include?("utensils")) && 
            !(prof.name.include?("supplies")) && !(prof.name.include?("tools")) && 
            !(prof.name.include?("kit")) && !(prof.name.include?("Saving")) && 
            !(["Bagpipes","Drum","Dulcimer","Flute","Lute","Lyre","Horn","Pan flute","Shawm","Viol"].include?(prof.name))
        end.map do |prof|
            {"id":prof.id,"name":prof.name}
        end
    end

    def saving_throws
        self.proficiencies.filter do |prof|
            prof.name.include?("Saving")
        end.map do |prof|
            {"id":prof.id,"name":prof.name}
        end
    end

    def inst_profociencies
        if (self.name == "Monk" || self.name == "Bard")
        instruments = ["Bagpipes", "Drum", "Dulcimer", "Flute", "Lute", "Lyre", "Horn", "Pan flute", "Shawm", "Viol"]
            self.proficiencies.filter do |prof|
                instruments.include?(prof.name)
            end.map do |prof|
                {"id":prof.id,"name":prof.name}
            end + [{"choose": self.proficiency_instruments}]
        end
    end

    def skill_proficiencies
        case self.name
        when "Barbarian"
            skill=["Skill: Animal Handling","Skill: Athletics","Skill: Intimidation","Skill: Nature","Skill: Perception","Skill: Survival"]
        when "Bard"
            skill=["Skill: Acrobatics", "Skill: Animal Handling", "Skill: Arcana", "Skill: Athletics", "Skill: Deception", "Skill: History", "Skill: Insight", "Skill: Intimidation", "Skill: Investigation", "Skill: Medicine", "Skill: Nature", "Skill: Perception", "Skill: Performance", "Skill: Persuasion", "Skill: Religion", "Skill: Sleight of Hand", "Skill: Stealth", "Skill: Survival"]
        when "Cleric"
            skill=["Skill: History","Skill: Insight","Skill: Medicine","Skill: Persuasion","Skill: Religion"]
        when "Druid"
            skill=["Skill: Animal Handling", "Skill: Arcana", "Skill: Insight", "Skill: Medicine", "Skill: Nature", "Skill: Perception", "Skill: Religion", "Skill: Survival"]
        when "Fighter"
            skill=["Skill: Acrobatics", "Skill: Animal Handling", "Skill: Athletics", "Skill: History", "Skill: Insight", "Skill: Intimidation", "Skill: Perception", "Skill: Survival"]
        when "Monk"
            skill=["Skill: Acrobatics", "Skill: Athletics", "Skill: History", "Skill: Insight", "Skill: Religion", "Skill: Stealth"]
        when "Paladin"
            skill=["Skill: Athletics", "Skill: Insight", "Skill: Intimidation", "Skill: Medicine", "Skill: Persuasion", "Skill: Religion"]
        when "Ranger"
            skill=["Skill: Animal Handling", "Skill: Athletics", "Skill: Insight", "Skill: Investigation", "Skill: Nature", "Skill: Perception", "Skill: Stealth", "Skill: Survival"]
        when "Rogue"
            skill=["Skill: Acrobatics", "Skill: Athletics", "Skill: Deception", "Skill: Insight", "Skill: Intimidation", "Skill: Investigation", "Skill: Perception", "Skill: Performance", "Skill: Persuasion", "Skill: Sleight of Hand", "Skill: Stealth"]
        when "Sorcerer"
            skill=["Skill: Arcana", "Skill: Deception", "Skill: Insight", "Skill: Intimidation", "Skill: Persuasion", "Skill: Religion"]
        when "Warlock"
            skill=["Skill: Arcana", "Skill: Deception", "Skill: History", "Skill: Intimidation", "Skill: Investigation", "Skill: Nature", "Skill: Religion"] 
        when "Wizard"
            skill=["Skill: Arcana", "Skill: History", "Skill: Insight", "Skill: Investigation", "Skill: Medicine", "Skill: Religion"]
        end
            self.proficiencies.filter do |prof|
                skill.include?(prof.name)
            end.map do |prof|
                {"id":prof.id,"name":prof.name}
            end + [{"choose": self.proficiency_skill}]
    end

    def tools_proficiencies
        if (self.name == "Monk")
            tools = ["Alchemist's supplies", "Brewer's supplies", "Calligrapher's supplies", "Carpenter's tools", "Cartographer's tools", "Cobbler's tools", "Cook's utensils", "Glassblower's tools", "Jeweler's tools", "Leatherworker's tools", "Mason's tools", "Painter's supplies", "Potter's tools", "Smith's tools", "Tinker's tools", "Weaver's tools", "Woodcarver's tools", "Disguise kit", "Forgery kit"] 
            self.proficiencies.filter do |prof|
                tools.include?(prof.name)
            end.map do |prof|
                {"id":prof.id,"name":prof.name}
            end + [{"choose": self.proficiency_tools}]
        end
    end

    def choose_proficiencies
        [self.skill_proficiencies(),self.inst_profociencies(),self.tools_proficiencies()].compact
    end

end
