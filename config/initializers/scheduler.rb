s = Rufus::Scheduler.singleton

s.every '2min' do
  puts "\n\n Updating quotes! \n\n"
  UpdateQuotes.call
end
