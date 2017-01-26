require "charmkit"

class Nginx < Charmkit::Scroll
  depends_on "nginx-full"

end
