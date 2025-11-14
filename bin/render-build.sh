#!/usr/bin/env bash
# exit on error
set -o errexit

echo "🔧 Installing dependencies..."
bundle install

echo "🎨 Precompiling assets..."
bundle exec rake assets:precompile

echo "🧹 Cleaning old assets..."
bundle exec rake assets:clean

echo "🗄️  Running database migrations..."
bundle exec rake db:migrate

echo "✅ Build completed successfully!"