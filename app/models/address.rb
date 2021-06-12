class Address < ApplicationRecord

    belongs_to :sell_item, optional: true

end
