predefined_sources = [
  {
    name: 'First source',
    url: 'first-source.com',
    connector: 'first_source'
  },
  {
    name: 'Second source',
    url: 'second-source.com',
    connector: 'second_source'
  }
]

existing_sources = Source.all

predefined_sources.each do |new_source_data|
  next if existing_sources.any? { |source| source.name == new_source_data[:name] }
  Source.create(new_source_data)
end

p "All sources created"