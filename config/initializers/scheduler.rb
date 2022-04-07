s = Rufus::Scheduler.singleton

st = s.every '2s' do
  puts "\n\n Updating quotes! \n\n"
  UpdateQuotes.call
end
