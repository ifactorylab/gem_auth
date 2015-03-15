require "gem_auth/version"
require "gem_auth/current_user"

module GemAuth

  class << self
    attr_accessor :redis, :current_user
  end

  def authorize_partner(token=nil)
    GemAuth.current_user = nil
    (token ||= header_token) rescue return head(401)
    response = authenticate_partner(token)
    return head 401 if response.empty?
    GemAuth.current_user = CurrentUser.new(id: response['id'], token: token)
  rescue => e
    puts e
    head 401
  end

  def header_token
    UUIDTools::UUID.parse(request.headers['HTTP_VENICE_AUTHORIZATION']).to_s
  end

  def redis_partner_auth_key(token)
    "partner:auth:#{token}"
  end

  def retrieve_redis_partner_auth_token(token)
    GemAuth.redis.hgetall redis_partner_auth_key(token)
  end

  def authenticate_partner(token)
    return nil unless GemAuth.redis
    retrieve_redis_partner_auth_token(token)
  end

end
