class Building
    attr_accessor :name, :price, :colour, :type, :owner

    def initialize(attributes = {})
      @name = attributes["name"]
      @price = attributes["price"]
      @colour = attributes["colour"]
      @type = attributes["type"]
      @owner = "nobody"
    end

    def show_building
      case @colour
      when "Brown"
        show_color = "🟫"
      when "Red"
        show_color = "🟥"
      when "Green"
        show_color = "🟩"
      when "Blue"
        show_color = "🟦"
      else
        show_color = '⚪'
      end

      if @type == "go"
        return "#{show_color} #{@name}"
      else
        return "#{show_color} #{@name} [$#{@price}]"
      end
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
