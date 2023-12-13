require 'file/tail'
require 'sidekiq'

class LogBrodcastJob
  include Sidekiq::Job

  def perform(*args)
    File::Tail::Logfile.open(FILE) do |log|
      log.backward(10).tail { |line|  ActionCable.server.broadcast("log_channel", { data: line }) }
    end
  end
end
