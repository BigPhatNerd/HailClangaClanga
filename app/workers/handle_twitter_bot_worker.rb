require 'sidekiq-scheduler'
class HandleTwitterBotWorker
  include Sidekiq::Worker

  def perform(*args)
    
  end
end
