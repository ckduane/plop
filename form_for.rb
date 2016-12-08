def form_for(stuff)
  if stuff.is_a? ActiveRecord::Base
    # make not nested route
  else
    "#{stuff[0].class.name.downcase}s/#{stuff[0].id}/#{stuff[1].class.name.downcase}s/#{stuff[1].id}"
  end
end
