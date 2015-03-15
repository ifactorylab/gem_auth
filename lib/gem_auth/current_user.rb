module GemAuth
  class CurrentUser
    attr_reader :id, :token

    def initialize(id: nil, token: nil)
      @id = id
      @token = token
    end
  end
end