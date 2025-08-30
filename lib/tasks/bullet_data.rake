namespace :reloaderpro do
  desc 'Import bullet data from JBM Ballistics'
  task bullet_data: :environment do
    require 'mechanize'
    
    mechanize = Mechanize.new
    mechanize.user_agent_alias = 'Mac Safari'
    
    # Find or create the ManufacturerType for "Bullet"
    manufacturer_type = ManufacturerType.find_or_create_by(name: 'Bullet')
    manufacturer_type_id = manufacturer_type.id
    
    puts "Starting JBM Ballistics manufacturer import..."
    puts "Using ManufacturerType: '#{manufacturer_type.name}' (ID: #{manufacturer_type_id})"
    puts "=" * 60
    
    begin
      # Fetch the main page with manufacturer list
      main_url = 'https://jbmballistics.com/ballistics/lengths/lengths.shtml'
      puts "Fetching manufacturer list from: #{main_url}"
      
      page = mechanize.get(main_url)
      
      # Find all manufacturer links in the table
      # The page has a table with manufacturer links
      manufacturer_links = page.search('table').first.search('a')
      
      puts "Found #{manufacturer_links.count} manufacturer links"
      puts "-" * 60
      
      manufacturers_created = 0
      manufacturers_existing = 0
      
      manufacturer_links.each_with_index do |link, index|
        manufacturer_name = link.text.strip
        
        # Skip empty names
        next if manufacturer_name.empty?
        
        puts "[#{index + 1}/#{manufacturer_links.count}] Processing: #{manufacturer_name}"
        
        # Create or find manufacturer with required manufacturer_type_id
        manufacturer = Manufacturer.find_or_create_by(
          name: manufacturer_name,
          manufacturer_type_id: manufacturer_type_id
        )
        
        if manufacturer.previously_new_record?
          manufacturers_created += 1
          puts "  ✓ Created new manufacturer: #{manufacturer_name}"
        else
          manufacturers_existing += 1
          puts "  - Manufacturer already exists: #{manufacturer_name}"
        end
      end
      
      puts "\n" + "=" * 60
      puts "Summary:"
      puts "  Created: #{manufacturers_created} new manufacturers"
      puts "  Existing: #{manufacturers_existing} manufacturers already in database"
      puts "  Total: #{manufacturers_created + manufacturers_existing} manufacturers processed"
      puts "=" * 60
      puts "Import completed successfully!"
      
    rescue => e
      puts "FATAL ERROR: #{e.message}"
      puts e.backtrace.first(5)
      exit 1
    end
  end
end