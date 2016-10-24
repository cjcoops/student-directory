def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.tr("\n","")
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "Which cohort is #{name} in?"
    cohort = gets.tr("\n","").downcase.to_sym
    if cohort.empty? then cohort = :november end
    #add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} #{students.count == 1? "student" : "students"}"
    puts "Add the next student"
    #get another name from the user
    name =  gets.chomp
  end
  #return the array of students
  students
end

def begin_with(students)
  puts "Enter the first letter of the students name you wish to view"
  choice = gets.chomp.downcase
  students.select{|student| student[:name].downcase.start_with?(choice)}
end

def print_header
  puts "The students of Villains Academy".center(30)
  puts "-------------".center(30)
end

def print(students)
  students.select{|student| student[:name].length < 12}.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(30)
  end
end

def print_grouped(students)
  #get array of different cohorts
  cohorts = []
  students.each do |student|
    cohorts <<  student[:cohort]
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great #{students.count == 1? "student" : "students"}".center(30)
end

students = input_students
#students_start_with = begin_with(students)
print_header
print(students)
print_footer(students)
#print_grouped(students)
