class Building
    attr_accessor :name, :price, :colour, :type, :owner

    def initialize(attributes = {})
      @name = attributes["name"]
      @price = attributes["price"]
      @colour = attributes["colour"]
      @type = attributes["type"]
      @owner = "nobody"
    end
  end


  # {
  #   "name": "GO",
  #   "type": "go"
  # },
  # {
  #   "name": "The Burvale",
  #   "price": 1,
  #   "colour": "Brown",
  #   "type": "property"
  # },
