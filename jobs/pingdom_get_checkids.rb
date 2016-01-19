require 'mysql2'

SCHEDULER.every '10s', :first_in => 0 do |job|

  # Myql connection
  db = Mysql2::Client.new(:host => "nmon.logitek.me", :username => "root", :password => "", :port => 3306, :database => "nmon_staging_production" )

  # Mysql query
  sql = "SELECT check_name, check_id FROM checks"

  # Execute the query
  results = db.query(sql).each
  
  rows = []

  results.each do |result|
    row = {
      :label => result['check_name'],
      :value => result['check_id']}
      rows << row
    end

  # Update the List widget
  send_event('check_ids', { items: rows })  

end

