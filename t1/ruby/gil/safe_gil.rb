array = []
mutex = Mutex.new

5.times.map do
  Thread.new do

    mutex.synchronize do
      1000.times do
        array << nil
      end
    end

  end
end.each(&:join)

puts array.size
