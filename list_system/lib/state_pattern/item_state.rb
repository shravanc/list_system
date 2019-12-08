class ItemState < State

def publish
  return HTTParty.post(construct_url, :headers => construct_header, :body => construct_body("published").to_json)
end

def unpublish
  return HTTParty.post(construct_url, :headers => construct_header, :body => construct_body("unpublished").to_json)
end

private

def construct_body state
  {"data"=> { "message"=> "Item state update", "resource" => "item", "state" => state} }
end

def construct_url
  domain = "amazon.stream.com"
  host = "http://" + domain + ":3004/actions"
  host
end

def construct_header
  {'Content-Type'=>'application/json', 'Accept' => 'application/json'}
end


end
