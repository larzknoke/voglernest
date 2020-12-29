class Feed < ApplicationRecord
    default_scope { order(priority: :asc) }
    has_many_attached :feedbilder
end
