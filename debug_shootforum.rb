#!/usr/bin/env ruby
require 'mechanize'

mechanize = Mechanize.new
mechanize.user_agent_alias = 'Mac Safari'

puts "Attempting to fetch shootforum.com bullet database..."
begin
  page = mechanize.get('http://www.shootforum.com/bulletdb/bullets.php')
  
  puts "Page fetched successfully!"
  puts "Page title: #{page.title}"
  puts "\n=== Forms on page ==="
  puts "Number of forms: #{page.forms.count}"
  
  page.forms.each_with_index do |form, i|
    puts "\nForm #{i}:"
    form.fields.each do |field|
      puts "  Field: #{field.name} (#{field.class})"
    end
  end
  
  puts "\n=== Select elements ==="
  selects = page.search('select')
  puts "Number of select elements: #{selects.count}"
  
  selects.each do |select|
    puts "\nSelect element:"
    puts "  Name: #{select['name']}"
    puts "  ID: #{select['id']}"
    options = select.search('option')
    puts "  Number of options: #{options.count}"
    if options.count > 0
      puts "  First 5 options:"
      options.first(5).each do |opt|
        puts "    Value: #{opt['value']}, Text: #{opt.text.strip}"
      end
    end
  end
  
  puts "\n=== Tables on page ==="
  tables = page.search('table')
  puts "Number of tables: #{tables.count}"
  
  if tables.any?
    first_table = tables.first
    rows = first_table.search('tr')
    puts "First table has #{rows.count} rows"
    
    if rows.count > 1
      puts "\nFirst data row columns:"
      first_data_row = rows[1]
      cols = first_data_row.search('td')
      cols.each_with_index do |col, i|
        puts "  Column #{i}: #{col.text.strip[0..30]}..."
      end
    end
  end
  
  puts "\n=== Save page for inspection ==="
  File.write('shootforum_page.html', page.body)
  puts "Page saved to shootforum_page.html for inspection"
  
rescue => e
  puts "Error: #{e.message}"
  puts "Backtrace:"
  puts e.backtrace.first(5)
end