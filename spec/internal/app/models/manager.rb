class Manager < ::ActiveRecord::Base
  belongs_to :organization

  has_many :active_users, -> { where(inactive: [nil, false]) }, class_name: "User"
  has_many :users, inverse_of: :organization
  has_many :advisors, through: :users
  has_many :not_joe, -> { where.not(name: "Joe" ) }, through: :users, source: :advisor
end
