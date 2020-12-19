#!/usr/bin/env ruby

require "webrick"
require_relative 'guitar'

=begin
    Example usage:
        http://localhost:5001/ (this will show the specified error message)
        http://localhost:5001/guitar_with?tuning=e,a,d,g,b,e (Standard Guitar)
        http://localhost:5001/guitar_with?tuning=e,a,d,g (Standard Bass)
=end

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
    def do_GET (request, response)
      if request.query["tuning"]
        tuning = request.query["tuning"]
            response.status = 200
            response.content_type = "text/plain"
            result = nil

            case request.path
              when "/guitar_with"
                guitar = Guitar.new(tuning.scan(/(.#|[a-z])/).flatten)
                guitar.build_strings
                result = guitar.strings
              else
                result = "No such method"
            end
            response.body = JSON.pretty_generate(result)
        else
            response.status = 500
            response.body = "You did not provide the correct parameters"
        end
    end
end

server = WEBrick::HTTPServer.new(:Port => 5001)

server.mount "/", MyServlet

trap("INT") {
    server.shutdown
}

server.start
