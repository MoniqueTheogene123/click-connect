# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  bio                    :text
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_skills, class_name: "UserSkill", foreign_key: "user_id", dependent: :destroy
  has_many :user_projects, class_name: "UserProject", foreign_key: "user_id", dependent: :destroy

  has_many :skills, through: :user_skills, source: :skill
  has_many :projects, through: :user_projects, source: :project

  scope :with_skill, ->(skill) { joins(:skills).where(skills: { id: skill.id }) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def profile_image_url
    "https://picsum.photos/200/300?random=#{id}"
  end
end
