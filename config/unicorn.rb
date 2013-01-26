working_directory "/home/sites/elcoding.com/www/current/"
listen "/home/sites/elcoding.com/www/current/tmp/sockets/unicorn.sock", :backlog => 64
pid "/home/sites/elcoding.com/www/current/tmp/pids/unicorn.pid"
stderr_path "/home/sites/elcoding.com/www/current/log/unicorn.log"
stdout_path "/home/sites/elcoding.com/www/current/log/unicorn.log"


worker_processes 2
timeout 30

