require 'socket'                                    # Require socket from Ruby Standard Library (stdlib)

host = 'localhost'
port = 2000

server = TCPServer.open(host, port)                 # Socket to listen to defined host and port
puts "Server started on #{host}:#{port} ..."        # Output to stdout that server started

loop do                                             # Server runs forever
  client = server.accept                            # Wait for a client to connect. Accept returns a TCPSocket
  lines = []
  while (line = client.gets) 
    line = line.chomp
  	break if line.empty?  							# Read the request and collect it until it's empty
    lines << line
  end
  puts lines

  filename = lines [0].gsub(/GET \//, '').gsub(/\ HTTP.*/, '')
  headers = []

  if File.exists?(filename)
    body = File.read(filename)
    headers << "HTTP/1.1 200 OK"
    if filename =~ /.css/
      filetype = "text/css"
    elsif filename =~ /.html/
      filetype = "text/html"
    else
      filetype = "text/plain"
    end
    headers << "Content-Type: #{filetype}"
  else
  	body = "File not found\n"
    headers << "HTTP/1.1 404 Not Found"
    headers << "Content-Type: text/plain"
  end
  	
  	
  headers <<	"Content-Length = #{body.size}"
  headers <<	"Connection: close"

  

  headers = headers.join("\r\n")
  response = [headers, body].join("\r\n\r\n")
        
                                              # Output the full request to stdout

  client.puts(response)                       # Output the current time to the client
  client.close                                      # Disconnect from the client
end
