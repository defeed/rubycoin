require 'digest'

module RubyCoin
  class Block
    attr_reader :data
    attr_reader :prev
    attr_reader :hash
    attr_reader :difficulty
    attr_reader :time
    attr_reader :nonce

    # Usage:
    # b0 = RubyCoin::Block.new("Hello blockchain", '0'*64)
    # b1 = RubyCoin::Block.new("Mining blocks like noone's business", b0.hash)

    def initialize(data, prev, difficulty: '00000')
      @data = data
      @prev = prev
      @difficulty = difficulty
      @nonce, @hash, @time = mine
    end

    def mine
      nonce = 0
      time = Time.now.to_i

      loop do
        hash = Digest::SHA256.hexdigest(
          "#{nonce}#{time}#{difficulty}#{prev}#{data}"
        )

        if hash.start_with?(difficulty)
          return [nonce, hash, time]
        else
          nonce += 1
        end
      end
    end
  end
end
