@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = gets.tr("\n","")
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "Which cohort is #{name} in?"
    cohort = gets.tr("\n","").downcase.to_sym
    if cohort.empty? then cohort = :november end
    #add the student hash to the array
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} #{@students.count == 1? "student" : "students"}"
    puts "Add the next student"
    #get another name from the user
    name =  gets.chomp
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

#def begin_with(students)
#  puts "Enter the first letter of the students name you wish to view"
#  choice = gets.chomp.downcase
#  students.select{|student| student[:name].downcase.start_with?(choice)}
#end

def print_header
  puts "The students of Villains Academy".center(30)
  puts "-------------".center(30)
end

def print_students_list
  @students.select{|student| student[:name].length < 12}.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(30)
  end
end

#def print_grouped
#  #get array of different cohorts
#  cohorts = []
#  @students.each do |student|
#    cohorts <<  student[:cohort]
#  end
#end

def print_footer
  puts "Overall, we have #{@students.count} great #{@students.count == 1? "student" : "students"}".center(30)
end

#students = input_students
#students_start_with = begin_with(students)
#print_header
#print(students)
#print_footer(students)
#print_grouped(students)



def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and do what the user has asked
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end


interactive_menu
