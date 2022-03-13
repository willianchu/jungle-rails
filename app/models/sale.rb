class Sale < ActiveRecord::Base

    #AR Scope

    def self.active
      where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
    end
      
    def self.active_name
      Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).first.name
    end
    
    def self.active_percent_off
      Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).first.percent_off
    end
      
 
    def finished?
      ends_on < Date.current
    end

    def upcoming?
      starts_on > Date.current
    end

    def active?
      !finished? && !upcoming?
    end

end
