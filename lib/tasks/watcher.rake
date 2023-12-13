require 'file/tail'

desc "Print something five times."
task :watch do  
  filename = Rails.root.join('log/development.log').to_s
  number = 5
  File::Tail::Logfile.open(filename) do |log|
    log.backward(number).tail { |line|  ActionCable.server.broadcast("log_channel", { data: line }) }
  end
end