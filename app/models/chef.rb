class Chef < ApplicationRecord
  belongs_to :brigade
  belongs_to :guest
end
