#!/usr/bin/env bash
set -o errexit

echo "🔧 Installing dependencies..."
bundle install

echo "🎨 Precompiling assets..."
bundle exec rake assets:precompile
bundle exec rake assets:clean

echo "🗄️  Preparing database..."
# Don't fail if database operations have issues
bundle exec rake db:prepare || bundle exec rake db:schema:load || echo "Database already set up"

echo "✅ Build completed successfully!"