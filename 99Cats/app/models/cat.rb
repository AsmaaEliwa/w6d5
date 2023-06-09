class Cat < ApplicationRecord
    validates :name, :birth_date, presence: true 

    validates :sex, length: {is: 1}, presence: true 

    validates :color, inclusion: { in: %w(white black brown orange), message: "%{value} is not a valid color" }

    def birth_date_cannot_be_future
        if birth_date.present? && birth_date > Date.today 
            errors.add(:birth_date, "can't be in the future")
        end
    end

    def age 
        diff = (Date.today - birth_date).to_i
        (diff/365.25).to_i
    end 

  

    
end
