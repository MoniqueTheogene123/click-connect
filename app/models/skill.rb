# == Schema Information
#
# Table name: skills
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Skill < ApplicationRecord
  has_many :user_skills, class_name: "UserSkill", foreign_key: "skill_id", dependent: :destroy
  has_many :users, through: :user_skills, source: :user

  normalizes :name, with: -> name { name.strip.downcase }
  validates :name, uniqueness: { case_sensitive: false }, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    # List the attributes you want to be searchable
    ["name"]
    # Add any other attributes that should be searchable
  end
end
