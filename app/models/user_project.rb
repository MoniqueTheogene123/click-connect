# == Schema Information
#
# Table name: user_projects
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_user_projects_on_project_id  (project_id)
#  index_user_projects_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (user_id => users.id)
#
class UserProject < ApplicationRecord
  belongs_to :user
  belongs_to :project

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :project, required: true, class_name: "Project", foreign_key: "project_id"
end
