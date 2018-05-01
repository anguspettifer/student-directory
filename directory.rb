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
  students = []
  name = gets.chomp.intern
  puts "Please enter cohort"
  cohort = gets.chomp.intern
  if months_array.include?(cohort) == false
    puts "That isn't a valid month, please re-enter"
    cohort = gets.chomp.intern
  end
  while !name.empty? do
    cohort = "Probably June" if cohort.empty?
    students << {name: name, cohort: cohort}
    x = ""
    x = "s" if students.count > 1
    puts "Now we have #{students.count} student" + x
    name = gets.chomp.intern
    break if name.empty?
    puts "please enter cohort"
    cohort = gets.chomp.intern
    if months_array.include?(cohort) == false
      puts "That isn't a valid month, please re-enter"
      cohort = gets.chomp.intern
    end
  end
  students
end


# and time to print

def print_header
  puts "The students of Villains Academy".center(50)
  puts "----------".center(50)
end


def print(students)
  cohort_array = students.map {|hash| hash[:cohort]}.uniq
  puts "the list of cohorts is #{cohort_array}"
  for i in 0...cohort_array.size
    puts cohort_array[i]
    students.each do |hash|
      next if hash[:cohort] != cohort_array[i]
      puts hash[:name]
    end
  end
#  n = 0
#  while n < students.size do
#    puts "#{students[n][:name]} (#{students[n][:cohort]} cohort)".center(50)
#    n += 1
#  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end

students = input_students
print_header
print(students)
print_footer(students)
