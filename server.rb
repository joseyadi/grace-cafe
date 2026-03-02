require "webrick"

root = File.expand_path(__dir__)

server = WEBrick::HTTPServer.new(
  Port:         3000,
  DocumentRoot: root,
  AccessLog:    [],
  Logger:       WEBrick::Log.new(File::NULL)
)

trap("INT")  { server.shutdown }
trap("TERM") { server.shutdown }

puts "Grace Cafe running at http://localhost:3000"
server.start
