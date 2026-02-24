# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Project < ApplicationRecord
  has_many :user_projects, class_name: "UserProject", foreign_key: "project_id", dependent: :destroy
  has_many :users, through: :user_projects, source: :user

  validates :title, presence: true
  validates :description, presence: true

  def self.ransackable_attributes(auth_object = nil)
    # List the attributes you want to be searchable
    ["title", "description"]
    # Add any other attributes that should be searchable
  end

  def to_s
    "#{title} #{description}"
  end
end
