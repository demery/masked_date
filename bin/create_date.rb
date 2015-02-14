#!/usr/bin/env ruby

require 'masked_date'

y, m, d = ARGV[0].split(/-/).map { |x| x =~ /^\d+$/ ? x.to_i : nil }

date = MaskedDate::Date.new y: y, m: m, d: d

date.month_format = 'b'

puts date
