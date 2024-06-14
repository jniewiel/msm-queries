class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list" })
  end

  def show
    the_id = params.fetch("the_id")
    
    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def junior
    youngest_director = Director.order({ :dob => :desc })
    @youngest_director = youngest_director.first

    render({ :template => "director_templates/junior" })
  end

  def eldest
    oldest_director = Director.order({ :dob => :desc })
    @oldest_director = oldest_director.last

    render({ :template => "director_templates/eldest" })
  end
end
