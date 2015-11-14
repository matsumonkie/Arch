class Rack::Attack

  throttle('req/ip', :limit => 300, :period => 3.minutes) do |req|
    req.ip unless req.path.starts_with?('/assets')
  end

  throttle('logins/ip', :limit => 5, :period => 1.minute) do |req|
    if req.path == '/api/sessions' && req.post?
      req.ip
    end
  end
end
