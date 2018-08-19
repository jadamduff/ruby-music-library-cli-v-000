module Concerns

  module Findable
    def self.find_by_name(name)
      self.all.find {|obj| obj.name == name}
    end
  end

end
