class Database
  attr_accessor :connect

  def self.connect(config)
    @connect = Mysql2::Client.new(
      :host     => config["host"],
      :username => config["username"],
      :password => config["password"],
      :database => config["database"],
      :socket   => config['socket'],
      :encoding => config['encoding']
    )
  rescue Mysql2::Error => error
    p error
  end
end
