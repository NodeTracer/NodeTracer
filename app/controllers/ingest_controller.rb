class IngestController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def create
    request.body.rewind

    json = JSON.parse(request.body.read)
    payload = json["payload"]
    payload.each do |(metric, value, timestamp)|
      Metric.create(key: metric, value: value, timestamp: Time.at(timestamp))
    end

    head :ok
  end
end
