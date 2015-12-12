seeds = File.join(Rails.root, 'db', 'seeds', '*.rb')
Dir[seeds].sort.each { |seed|
  load seed
}
