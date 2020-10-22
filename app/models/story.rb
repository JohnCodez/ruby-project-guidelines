class Story < ActiveRecord::Base
    has_many :choices
end