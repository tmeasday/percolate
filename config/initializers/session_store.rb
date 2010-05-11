# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_percolate_session',
  :secret      => '8985d992f86ead993c5416cdc30302716601c9996df544ebc64e4b72b5cfeb39fad22f105ac2828d5f9d2ced87070ee2cf972c1f147504054d94aaabe637a61e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
