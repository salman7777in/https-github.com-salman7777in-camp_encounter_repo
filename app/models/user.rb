class User < ApplicationRecord
    validates :my_attribute, countries_alpha2: true
end
