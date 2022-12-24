class Book < ApplicationRecord
    belongs_to:user
    validates :title,presence:true
    validates :body,presence:true
    validates :body,length: { in: 1..200  } 
end
