# deal with params in the controller, or at least 
# just put it in session

# helper allows something to be available to view and 
# controller

# params are very temporary. 
# stuff session in each route..

get '/' do
  # display a list of all notes
  @notes = Note.all unless Note.all.empty?
  erb :index  
end

get '/new' do
  # return an html form for creating a new note
  erb :_new, layout: false
end

post '/' do
  # create a new note
  content_type :json
  @note = Note.create(params)
  {id: @note.id, title: @note.title, content: @note.content}.to_json
  # redirect '/'
end

get '/:id' do
  # display a specific note
  session[:note_id] = params[:id]
  erb :_note, layout: false
end

get '/:id/edit' do
  # return an html form for editing a note
  session[:note_id] = params[:id]
  erb :_edit, layout: false
end

put '/:id' do
  # update a specific note
  note = Note.find(params[:id])
  note.title = params[:title]
  note.content = params[:content]
  note.save
  redirect '/'
end

get '/:id/delete' do
  # route to a confirmation page
  session[:note_id] = params[:id]
  erb :_delete, layout: false
end

delete '/:id' do
  # delete a specific note
  session[:note_id] = params[:id]
  note.destroy
  redirect '/'
end
