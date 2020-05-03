# Is it perfect? lol ;P

def ask(preguntas)
  get_state
  str(preguntas)
  @response = gets.chomp.downcase
end

@counter = 0

def quiz(question, correct_answer, hint)
  ask(question)
  case
  when @response.match?(correct_answer.to_s.downcase)
    handle_correct_answer
  when !@response.match?(correct_answer.to_s.downcase)
    handle_incorrect_answer(question, correct_answer, hint)
  end
end

# Helpers
def str(ing)
  ing.each_char do |letter|
    print letter
    sleep 0.01
  end
  # new line for answer prompt
  puts
  puts
end

def get_state
  absolute_path = Dir.getwd.match(/(\/.*\/)/).to_s
  @dir = Dir.getwd.delete_prefix!(absolute_path)

  @avail_dirs = Dir.children(Dir.getwd) 
end

def handle_correct_answer
  puts ["✅ That's it!", '✅ Yep, Good job', '✅ Correct', "✅ That's right" ].sample
  puts
  @counter = 0
end

def handle_incorrect_answer(question, correct_answer, hint)
  puts ['❌ Incorrect', '❌ Sorry', "❌ That's not it"].sample
  puts
  @counter += 1
  if @counter > 2
    puts "🔵 The answer is '#{correct_answer}' 🔵"
    puts
    @counter = 0
  else
    puts "🟡 Hint - #{hint} 🟡" if @counter == 2
    puts
    quiz(question, correct_answer, hint)
  end
end

quiz('?- What command is used for listing the contents of a directory?', 'ls', 'Listing contents or looking around')
quiz('?- What command is used to navigate to other directories?', 'cd', 'Changing directories')
quiz("?- If 'pwd' returns #{Dir.getwd}, what directory are you in?", @dir, "you/are/here")
quiz("?- If 'ls' returns a list of the following things:\n#{@avail_dirs} Where can you navigate to?", @avail_dirs, "Any of the directories listed from 'ls'")
quiz("?- If we want to go into a directory that already exists, say '#{@avail_dirs.sample}', do we need to make it again?", 'no', 'We dont have to use mkdir if the directory is already made')
quiz("?- If we have directory path, say '~/path/to/example/directory/', how can we get to the 'example' directory with just one command?", 'cd path/to/example', 'Try to cd the whole path at once')
quiz("?- If we have a ruby file we want to run in 'ruby_examples/example.rb' how could we run it from anywhere?", "ruby ~/ruby_examples/example.rb", "ruby ~/path/to/file, the '~' refers to root rather than where you are at currently.")

puts "🇺🇸 Getting better everyday 🇺🇸"