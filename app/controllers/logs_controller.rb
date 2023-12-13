require 'file/tail'

class LogsController < ApplicationController
  def index ;end

  def streaming
    # file = '/Users/prateekbhatnagar/work/projects/Private-Magnet/log/developmen.log'
    workers = Sidekiq::Workers.new
    if workers.size <= 1
      LogBrodcastJob.perform_async 
    else
      data = %x( tail -n 10 #{FILE} )
    end
  
    render json: {data: data}, status: 200
  end
end
