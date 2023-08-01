class JsonWebToken 
    SECTRET_KEY = Rails.application.secrets.secret_key_base.to_s

    def self.encode(payload , exp = 1000.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload , SECTRET_KEY)
    end

    def self.decode(token)
        decoded = JWT.decode(token , SECTRET_KEY , true , algorithm:'HS256')[0]
        HashWithIndifferentAccess.new decoded
    end
end