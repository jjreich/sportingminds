class ProcessGoalDateChecker
  include Sidekiq::Worker

  def perform
    puts 'Checking Goals'
  end
end