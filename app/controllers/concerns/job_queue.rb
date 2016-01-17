require 'thread'

module JobQueue
  extend ActiveSupport::Concern
  
  def find_queue
    @queue = @queue || Queue.new
    Thread.new do
      while current_progress = @queue.pop(false)
        10.times do |i|
          sleep(1)
          current_progress.update_attributes!(percent: (i+1) * 10)
        end
      end
      ActiveRecord::Base.connection.close
    end
  end
end
