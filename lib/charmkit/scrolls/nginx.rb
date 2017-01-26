require "charmkit"

class Nginx < Charmkit::Scroll
  depends_on "nginx-full"

  def add_host(server_name, application_type, template = 'vhost.conf')
    case application_type
    when :php
      inline_template 'php.vhost.conf', "/etc/nginx/sites-enabled/#{server_name}",
                      app_path: '/srv/app', server_name: server_name
    when :nodejs
      inline_template 'nodejs.vhost.conf', "/etc/nginx/sites-enabled/#{server_name}",
                      app_path: '/srv/app', server_name: server_name
    end
  end
end

__END__

@@ php.vhost.conf

suitable nginx host configuration for a php applications

@@ nodejs.vhost.conf

suitable nginx host configuration for a nodejs application
