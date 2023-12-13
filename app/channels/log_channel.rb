require 'file/tail'


class LogChannel < ApplicationCable::Channel
  def subscribed
    stream_from "log_channel"
  end

  def unsubscribed
    Rails.logger.info "=======UNSUBSCRIBED====="
    # if ActionCable.server.connections.length == 0
    #   Sidekiq.redis(&:flushdb)
    # end
  end
end
