require 'pry'

class Show < ActiveRecord::Base

    def self.highest_rating
        self.all.maximum('rating')
    end

    def self.most_popular_show
        Show.where('rating = ?', highest_rating)[0]
    end

    def self.lowest_rating
        self.all.minimum('rating')
    end

    def self.least_popular_show
        Show.where('rating = ?', lowest_rating)[0]
    end

    def self.ratings_sum
        self.all.sum('rating')
    end

    def self.popular_shows
        self.all.where('rating > 5')
    end

    def self.shows_by_alphabetical_order
        self.all.order(name: :asc)
    end

end