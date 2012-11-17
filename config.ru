$KCODE = 'u' if RUBY_VERSION < '1.9'
require './web'
run Sinatra::Application
$stdout.sync = true