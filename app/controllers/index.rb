get '/' do
  # display a list of all notes
  @notes = Note.all
  erb :index  
end

get '/new' do
  # return an html form for creating a new note
  erb :new
end

post '/' do
  # create a new note
  Note.create(params)
  redirect '/'
end

get '/:id' do
  # display a specific note
  @note = Note.find(params[:id])
  erb :note
end

get '/:id/edit' do
  # return an html form for editing a note
  @note = Note.find(params[:id])
  erb :edit
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
  @note = Note.find(params[:id])
  erb :delete
end


delete '/:id' do
  # delete a specific note
  Note.find(params[:id]).destroy
  redirect '/'
end
