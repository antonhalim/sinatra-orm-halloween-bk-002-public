env = ARGV[0].to_s
if env != "test" && env != "development"
  raise "Please call this script with test or development arguments"
end

`sequel -m db/migrations sqlite://db/halloween_#{env}.db`
