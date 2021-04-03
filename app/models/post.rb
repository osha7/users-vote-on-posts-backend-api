class Post < ApplicationRecord

    has_many :votes

    validates :title, :author, :content, presence: true

end

