# rubocop:disable Metrics/BlockLength
namespace :rp do
  desc 'apply ridgepole'
  task :apply, :environment do
    ridgepole('--apply', "--file #{schema}")
    if Rails.env.development?
      exec_annotate

    end
  end

  desc 'show diff'
  task :diff, :environment do
    ridgepole('--diff', "#{config} #{schema}")
  end

  desc 'export current db to Schemafile'
  task :export, :environment do
    ridgepole('--export', "--output #{schema}")
  end

  def config
    Rails.root.join('config', 'database.yml')
  end

  def schema
    Rails.root.join('db', 'Schemafile.rb')
  end

  def ridgepole(*options)
    command = ['bundle exec ridgepole', "--config #{config} --env #{Rails.env}"]
    system [command, options].join(' ')
  end

  def exec_annotate
    return unless Rails.env.development?

    system 'bundle exec annotate'
  end

  def exec_dump_schema
    return unless Rails.env.development?

    system 'bundle exec rails db:schema:dump'
  end
end
# rubocop:enable Metrics/BlockLength
