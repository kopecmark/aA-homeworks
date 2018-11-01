fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

longest_fish = ""
fish.each do |fish1|
  longest_fish = fish1 if longest_fish.length < fish1.length
  temp_longest_fish = ""
  fish.each do |fish2|
    temp_longest_fish = fish2 if fish1.length < fish2.length
  end
  if temp_longest_fish.length > longest_fish.length
    longest_fish = temp_longest_fish
  end
end

p longest_fish

class Array
  def merge_sort(&prc)
    prc||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
  end
end

def nlogn_biggest_fish(fishes)
  prc = Proc.new { |x, y| x.length <=> y.length }
  fishes.merge_sort(&prc).last
end
p nlogn_biggest_fish(fish)
