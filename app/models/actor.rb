class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters
  
    def full_name
      "#{self.first_name} #{self.last_name}"
    end
  
    def list_roles
      # # "#{self.Character},#{self.name} "
      # self.characters.pluck :Character do "#{character.name} - #{character.show.name}"
      self.characters.map do |character|
        "#{character.name} - #{character.show.name}"
      end
    end
end