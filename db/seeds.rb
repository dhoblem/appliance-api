APPLIANCES = 1000
MAX_TARGETS_PER_APPLIANCE = 5

def randomize(string)
  "#{rand 100000}-#{string}"
end

def create_appliance
  appliance = Appliance.create! name:     randomize(Faker::Internet.domain_name),
                                customer: Faker::Company.name

  rand(MAX_TARGETS_PER_APPLIANCE + 1).times {create_target(appliance)}

  if rand(100) > 90
    Target.create! appliance: appliance,
                   hostname:  randomize('localhost'),
                   address:   '127.0.0.1'
  end
end

def create_target(appliance)
  Target.create! appliance: appliance,
                 hostname:  randomize(Faker::Internet.domain_name),
                 address:   Faker::Internet.ip_v4_address,
                 is_alive: random_boolean = [true,false]
end

APPLIANCES.times {create_appliance}

['registered', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

