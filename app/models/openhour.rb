class Openhour < ApplicationRecord
    default_scope { order(reihenfolge: :asc) }
end