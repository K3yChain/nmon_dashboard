require 'dashing-contrib/jobs/pingdom_summary'

 DashingContrib::Jobs::PingdomSummary.run(
    every: '60s',
    event: 'pingdom-summary',
    username: ENV['PINGDOM_USERNAME'],
    password: ENV['PINGDOM_PASSWORD'],
    api_key:  ENV['PINGDOM_API_KEY'],
    # The team account is an optional argument, this should only be set if you are using a team account
    team_account: ENV['PINGDOM_TEAM_ACCOUNT'],
    list_top: 5,
    include_up: true,
 )