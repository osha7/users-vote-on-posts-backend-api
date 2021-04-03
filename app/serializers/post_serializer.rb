class PostSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :title, :author, :content, :created_at
end
