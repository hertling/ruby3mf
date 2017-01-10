#!/usr/bin/env ruby

require_relative '../lib/ruby3mf'

files = Dir["spec/ruby3mf-testfiles/#{ARGV[0] || "failing_cases"}/*.#{ARGV[1] || '3mf'}"]

files.each do |file|

  Log3mf.reset_log
  doc = Document.read(file)
  errors = Log3mf.entries(:error, :fatal_error)

  puts "=" * 100
  puts "Validating file: #{file}"
  errors.each do |ent|
    h = { context: ent[0], severity: ent[1], message: ent[2] }
    puts h
  end

end
