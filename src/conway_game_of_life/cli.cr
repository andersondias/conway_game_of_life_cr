class ConwayGameOfLife::Cli
  @population : ConwayGameOfLife::Population

  def initialize
    @population = ConwayGameOfLife::Population.new(width: 10, length: 10)
  end

  def run
    greeting
    generate_population
    instructions
    wait_user_input_and_print_next_generation
  end

  def clear
    system("clear")
  end

  def greeting
    clear
    puts "Welcome to Conway's game of life!"
    puts "Generating alive population..."
  end

  def instructions
    puts "Press enter to start the game and to move to next generation."
  end  

  def wait_user_input_and_print_next_generation(next_generation=false)
    gets
    clear

    @population.next_generation! if next_generation
    if alive_population == 0
      end_game
    else
      print_population
      wait_user_input_and_print_next_generation(true)
    end
  end

  def print_population
    @population.cells_matrix.each do |row|
      row.each do |cell|
        if cell.alive?
          print "🀫"
        else
          print "🀆"
        end
      end
      puts ""
    end
  end

  def generate_population
    @population.cells.each do |cell|
      cell.alive! if rand < 0.3
    end
    puts "Done!"
    puts "The initial population has #{alive_population} alive cells."
  end

  def end_game
    puts "Oops! All cells are dead! End of game!"
  end

  def alive_population
    @population.cells.select(&.alive?).size
  end
end
