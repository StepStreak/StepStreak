# frozen_string_literal: true

set :stage, :production

server '109.94.171.222', user: 'ubuntu', roles: %w[web app db]
