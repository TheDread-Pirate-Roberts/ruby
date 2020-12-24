#!/usr/bin/env ruby

require "webrick"
require_relative 'guitar'
require_relative 'chords'

=begin
    Example usage:
        http://localhost:5001/ (this will show the specified error message)
        http://localhost:5001/guitar_with?tuning=e,a,d,g,b,e (Standard Guitar)
        http://localhost:5001/guitar_with?tuning=e,a,d,g (Standard Bass)

        http://localhost:5001/chords?key="g%23" (%23 == #)
=end

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
    def do_GET (request, response)
            case request.path
              when "/guitar_with"
                tuning = request.query["tuning"]
                guitar = Guitar.new(tuning.scan(/(.#|[a-z])/).flatten)
                guitar.build_strings
                result = guitar.strings
              when "/chords"
                binding.pry
                c = Chords.new(request.query["key"][1..-2])
                result = {
                  one: c.i,
                  two: c.ii,
                  three: c.iii,
                  four: c.iv,
                  five: c.v,
                  six: c.vi,
                  seven: c.vii
                }
              else
                result = "No such method"
            end
            response.status = 200
            response.content_type = "text/plain"
            response.body = JSON.pretty_generate(result)
    end
end

server = WEBrick::HTTPServer.new(:Port => 5001)

server.mount "/", MyServlet

trap("INT") {
    server.shutdown
}

server.start
