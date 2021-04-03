class UserSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :user_name, :email, :password, :password_digest, :created_at
end
