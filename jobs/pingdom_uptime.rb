# include a built-in job
require 'dashing-contrib/jobs/pingdom_uptime'

DashingContrib::Jobs::PingdomUptime.run(
  every: '90s',
  event: "pingdom-uptime-dashboard",
  # check_id is Pingdom's check identifier
  check_id: '1955269',
  # specify PINGDOM_USERNAME in .env file under project root
  username: ENV['PINGDOM_USERNAME'],
  password: ENV['PINGDOM_PASSWORD'],
  api_key:  ENV['PINGDOM_API_KEY'],
  # The team account is an optional argument, this should only be set if you are using a team account
  team_account: ENV['PINGDOM_TEAM_ACCOUNT'],
  title: 'Dashboard'
)

