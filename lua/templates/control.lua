-- Here's to the crazy ones. The misfits. The rebels. The troublemakers.

-- The code below is just a "Hello World" that dumps the current links and their element classes
system.print('Debugging Control Unit...')
for linkName, element in pairs(library.getLinks()) do
  system.print(string.format('Found link `%s` of type `%s`', linkName, element.getClass()))
end

-- Stops execution
unit.exit()