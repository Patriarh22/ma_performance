predefined_sources = [
  {
    name: 'First source',
    url: 'first-source.com',
    connector: 'first'
  },
  {
    name: 'Second source',
    url: 'second-source.com',
    connector: 'second'
  },
  {
    name: 'Third source',
    url: 'third-source.com',
    connector: 'third'
  },
  {
    name: 'Fourth source',
    url: 'fourth-source.com',
    connector: 'fourth'
  },
  {
    name: 'Fifth source',
    url: 'fifth-source.com',
    connector: 'fifth'
  }
]

existing_sources = Source.all

predefined_sources.each do |new_source_data|
  next if existing_sources.any? { |source| source.name == new_source_data[:name] }
  Source.create(new_source_data)
end

p "All sources created"