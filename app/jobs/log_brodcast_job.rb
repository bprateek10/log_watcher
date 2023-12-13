require 'file/tail'
require 'sidekiq'

class LogBrodcastJob
  include Sidekiq::Job

  def perform(*args)
    filename = Rails.root.join('test_file.txt').to_s
    File::Tail::Logfile.open(filename) do |log|
      log.backward(10).tail { |line|  ActionCable.server.broadcast("log_channel", { data: line }) }
    end
  end
end
