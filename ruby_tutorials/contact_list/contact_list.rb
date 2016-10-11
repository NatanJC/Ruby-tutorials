def ask(question, kind="string")
  print question + " "
  answer = gets.chomp
  answer = answer.to_i if kind == "number"
  return answer
end

#answer = ask("What is your name?")
#puts answer

def add_contact
  contact = {"name" => "", "phone_num" => []}
  contact["name"] = ask("What is the person's name?")
  answer = ""
  while answer != "n"
    answer = ask("Do you want to add a phone number? (y/n)")
    if answer == "y"
      phone = ask("Enter a phone number:")
      contact["phone_num"].push(phone)
    end
  end
  return contact
end


contact_list = Array.new

#main
answer = ""
while answer != "n"
  contact_list.push(add_contact())
  answer = ask("Add another? (y/n)")
end

puts "--------------------"

contact_list.each do |contact|
  puts "Name: #{contact["name"]}"
  if contact["phone_num"].size > 0
    contact["phone_num"].each do |phone_number|
      puts "Phone: #{phone_number}"
    end
  end
  puts "--------------------"
end