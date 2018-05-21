class MatchingAlgorithm
  def initialize(subject)
    @subject = subject
  end

  def match
     return -1 if @subject.full_name == 'Ted Mosby'
     return 100 if @subject.full_name == 'Barney Stinson'
     rand(100)
  end
end
