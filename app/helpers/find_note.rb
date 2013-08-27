helpers do
  def note
    @note ||= Note.find(session[:note_id]) if session[:note_id]
  end
end
