# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

puts "-- Seeding database --"
emails = [
  "mtheogene@gmail.com",
]

emails.each do |email|
  puts "-- Adding #{email} --"
  User.find_or_create_by(email: email) do |user|
    user.password = SecureRandom.hex(8)
  end
end

puts "-- Seeding projects --"
Project.find_or_create_by(title: "API Gateway") do |project|
  project.description = "A middleware service that routes and authenticates requests between microservices"
end

Project.find_or_create_by(title: "DataSync Dashboard") do |project|
  project.description = "Real-time analytics dashboard that visualizes employee performance metrics"
end

Project.find_or_create_by(title: "CloudDeploy") do |project|
  project.description = "Automated CI/CD pipeline tool for deploying Rails apps to cloud infrastructure"
end

Project.find_or_create_by(title: "SecureVault") do |project|
  project.description = "Encrypted credential manager for storing and sharing team API keys safely"
end

Project.find_or_create_by(title: "TaskFlow") do |project|
  project.description = "A kanban-style project management tool for tracking team tasks and sprint progress"
end

Project.find_or_create_by(title: "CodeReview Bot") do |project|
  project.description = "An automated bot that scans pull requests and flags code quality issues before merging"
end

Project.find_or_create_by(title: "UserAuth Pro") do |project|
  project.description = "A reusable authentication system with OAuth2, two-factor authentication and role management"
end

Project.find_or_create_by(title: "LogTracer") do |project|
  project.description = "A centralized logging platform that aggregates and searches error logs across all services"
end

Project.find_or_create_by(title: "OpenBridge v2") do |project|
  project.description = "A communication layer that connects legacy enterprise systems to modern REST APIs"
end

Project.find_or_create_by(title: "DevMetrics") do |project|
  project.description = "A reporting tool that tracks developer productivity, commit history and code coverage trends"
end

Project.find_or_create_by(title: "InfraWatch") do |project|
  project.description = "A server monitoring dashboard that alerts teams when CPU, memory or disk usage spikes"
end

Project.find_or_create_by(title: "SnapDeploy") do |project|
  project.description = "A one-click deployment tool that packages and ships Rails apps to any cloud provider"
end

puts "--Done--"
