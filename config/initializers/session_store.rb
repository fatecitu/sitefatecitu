# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sitefatec_session',
  :secret      => '94279c18897a252e877d25eeda696140444584ad6fb273de28fdece165844562c9b4a140e43fe31cf6d932cb663f3b4096f23d93b8d885d4b6099412ee873b08'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
