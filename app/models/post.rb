class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true, length: { minimum: 250 }
    validates :summary, presence: true, length: { maximum: 250 }
    validates :category, presence: true, inclusion: { in: ["Fiction", "Non-Fiction"]}
    validate :clickbait

    def clickbait
        title_includes = [ /Won't Believe/, /Secret/, /Top \d/, /Guess/ ]
        if title_includes.none? { |t| t.match title }
            errors.add(:title, "must be clickbait")
    end
  end
end
