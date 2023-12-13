require 'file/tail'

class LogsController < ApplicationController
  def index ;end

  def streaming
    # file = '/Users/prateekbhatnagar/work/projects/Private-Magnet/log/developmen.log'
    file = Rails.root.join('test_file.txt').to_s
    workers = Sidekiq::Workers.new
    if workers.size <= 1
      LogBrodcastJob.perform_async 
    else
      data = %x( tail -n 10 #{file} )
    end
  
    render json: {data: data}, status: 200
  end
end
