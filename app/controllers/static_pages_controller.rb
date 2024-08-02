class StaticPagesController < ApplicationController
  require "net/http"

  def btc
    @bid = Hash.new
      @ask = Hash.new
      url = "https://api.binance.com/api/v3/depth?symbol=BTCUSDT&limit=5000"
      # url = "https://fapi.binance.com/fapi/v1/depth?symbol=BTCUSDT&limit=1000"
      resp = Net::HTTP.get_response(URI.parse(url))
      data = JSON.parse(resp.body)
      data["bids"].each do |bid|
        if bid[1].to_f > 5
          @bid.store(bid[0].to_f.round(0), bid[1].to_f.round(0))
        end
      end

      data["asks"].each do |ask|
         if ask[1].to_f > 5
          @ask.store(ask[0].to_f.round(0), ask[1].to_f.round(0))
         end
    end

    url_price = "https://api.binance.com/api/v3/avgPrice?symbol=BTCUSDT"
    resp = Net::HTTP.get_response(URI.parse(url_price))
      @price = JSON.parse(resp.body)
      @price = @price["price"].to_f.round(2)
    # puts data['bids'][0][1] #-> amount of bid
  end

  def eth
    @bid = Hash.new
    @ask = Hash.new
    url = "https://api.binance.com/api/v3/depth?symbol=ETHUSDT&limit=5000"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = JSON.parse(resp.body)
    data["bids"].each do |bid|
      if bid[1].to_f >= 100
      @bid.store(bid[0].to_f.round(0), bid[1].to_f.round(0))
      end
    end

    data["asks"].each do |ask|
       if ask[1].to_f >= 100
        @ask.store(ask[0].to_f.round(0), ask[1].to_f.round(0))
       end
    end
  end

  def ltc
  end
end
