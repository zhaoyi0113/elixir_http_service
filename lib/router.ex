defmodule Example.Router do
    use Plug.Router
  
    plug :match
    plug :dispatch
  
    get "/", do: send_resp(conn, 200, "Welcome")
    
    get "/about/:name" when name == "history" do
        send_resp(conn, 200, "Our website has a short, yet colorful history.")
    end

    # Use a variable in the route
    get "/about/:name" do
        send_resp(conn, 200, "#{name} is vital to our website's continued success.")
    end

    post "/about/:name" do
        send_resp(conn, 200, "This is a post request for #{name}.")
    end

    patch "/about/:name" do
        send_resp(conn, 200, "This is a patch request for #{name}.")
    end

    put "/about/:name" do
        send_resp(conn, 200, "This is a put request for #{name}.")
    end

    delete "/about/:name" do
        send_resp(conn, 200, "This is a delete request for #{name}.")
    end

    match _, do: send_resp(conn, 404, "Oops!")
  end