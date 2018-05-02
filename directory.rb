#array time
def input_students
  months_array = [
    :January,
    :February,
    :March,
    :April,
    :May,
    :June,
    :July,
    :August,
    :September,
    :October,
    :November,
    :December
  ]
  puts "Please enter names"
  puts "To finish, hit return twice"
  @students = []
  name = gets.chomp.intern
  puts "Please enter cohort"
  cohort = gets.chomp.intern
  if months_array.include?(cohort) == false
    puts "That isn't a valid month, please re-enter"
    cohort = gets.chomp.intern
  end
  while !name.empty? do
    cohort = "Probably June" if cohort.empty?
    @students << {name: name, cohort: cohort}
    x = ""
    x = "s" if @students.count > 1
    puts "Now we have #{@students.count} student" + x
    name = gets.chomp.intern
    break if name.empty?
    puts "please enter cohort"
    cohort = gets.chomp.intern
    if months_array.include?(cohort) == false
      puts "That isn't a valid month, please re-enter"
      cohort = gets.chomp.intern
    end
  end
end


# and time to print

def print_header
  puts "The students of Villains Academy".center(50)
  puts "----------".center(50)
end


def print_students_list
  cohort_array = @students.map {|hash| hash[:cohort]}.uniq
  puts "The list of cohorts is #{cohort_array}".center(50)
  for i in 0...cohort_array.size
    puts ""
    puts "#{cohort_array[i]}:"
    @students.each do |hash|
      next if hash[:cohort] != cohort_array[i]
      puts hash[:name]
    end
  end
end
def print_footer
  puts "Overall, we have #{@students.count} great students".center(50)
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
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
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  @students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
