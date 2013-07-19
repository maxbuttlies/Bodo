class TodosController < ApplicationController
  
  def index
  end
  def editor
    if params[:id] != nil
      topic = Topic.where(:_id => params[:id]).first
      @name = topic.name
      @date = topic.date
      @time = topic.time
      @id = params[:id]
    else
      @name = ""
      @date = 5.days.since.to_s.split(' ')[0]
      @time = "12:00"
    end 
  end

  def add 
  	query = params[:q]
  	splits = query.split(' ')

  	name = ""
    date = ""
    time = ""

  	splits.each { |e|  
  		if is_numeric? e
  			if e.length == 8
  				date = e[4,4]+"-"+e[2,2]+"-"+e[0,2]
        elsif e.length == 4
				  time = e[0,2]+":"+e[2,2]
        end
      else
        name = name +" " + e
      end
  	}

  	topic = Topic.new(:name => name, :date => date, :time => time)
  	topic.save!

    @msg = topic.to_json
  end

  def edit
  	name = params[:name]
  	date = params[:date]
  	time = params[:time]
    if(params[:id] != nil)
      topic = Topic.where(:_id => params[:id]).first
      topic.name = name
      topic.date = date
      topic.time = time

    else
  	 topic = Topic.new(:name => name, :date => date, :time => time)
   end
   topic.save!

   @msg = topic.to_json
  end

  def done
    if params[:id] != nil
      topic = Topic.where(:_id => params[:id]).first
      topic.done = true
      topic.save!
    end
  end

  def list
    if params[:name] == "" || params[:name] == nil
  	 topics = Topic.where('$or' => [{:done=>false},{:done=>nil}])
    else
     topics = Topic.where('$or' => [{:done=>false},{:done=>nil}], :name => '/'+params[:name]+'/')
    end
    @msg = topics.to_json
  end


  def is_numeric?(obj) 
   obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
 end
end
