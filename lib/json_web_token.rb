class JsonWebToken
  # secret to encode and decode token
  # In case of corporate environments you will be given a public key file for the dev, staging and pro environments
  # in such cse uncmment the below line and comment the next line.
  # Make sure to provide the file name instead of jwt-key-dev.pub.

  # HMAC_SECRET = Rails.root.join('jwt-key-dev.pub')
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  # Note that the default is 24 hours. In production this will be usually around 10 minutes.
  # Also note that in Corporate environments, there will not be an occasion to do encoding as it will be done by
  # the API Manager layer in front of your Micro service. So you can safely remove encode.
  def self.encode(payload, exp = 24.hours.from_now)
    # set expiry to 24 hours from creation time
    payload[:exp] = exp.to_i
    # sign token with application secret
    JWT.encode(payload, HMAC_SECRET)
  end

  # In case you are using public key, make sure to add algorithm=['RS256'] to  .decode
  def self.decode(token)
    # get payload; first index in decoded Array
    body = JWT.decode(token, HMAC_SECRET,verify=true)[0]
    HashWithIndifferentAccess.new body
  end
end