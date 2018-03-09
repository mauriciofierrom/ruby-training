=begin
So, Procs are blocks of code that are bound to a set of local variables
through health and sicknes, etc, etc. They are basically function objects.
You may even call them first class objects, BUT DO NOT DO SO! Check the
README of this repo, this IS NOT a Haskell training repo.

Lambdas are just a Kernel method to use procs, BUTT! There are two main differences
between our dear suspiciously named lambdas and the old Procs.

First, lambdas are more strict. They do check that the number of arguments they
get are right. I mean, I like to check my arguments too, over and over again in 
my head, until I can't sleep...

Second, (and this I actually knew but failed to explain and thus I'm making this
example) -return-s work differently in Procs then in lambdas. Procs do not respect
their environments. If some other loc is waiting to get executed they just return
as if the method was theirs. Lambdas are more well behaved, I guess their functional
influences have taught them better (still not a Haskell training repo). Their return
call just eh... returns the execution flow to the next line in the calling method.

Also, -lambda- is T-W-O characters shorter, and obviously has less surprising behavior.

BUTT (AGAIN) !! There is actually a -proc- method wich is a WHOOPIN' F-O-U-R
characters shorter! BUTT (YET AGAIN)!! there is also the stabby (lol) syntax
->() which is ONLY T-W-O characters long!. I think we have a clear winner. 

(Not really, even if lambda is prefered there MAY be some cases in which proc 
behavior is desired)

ONWARDS TO THE EXAMPLE!
=end

def rude_proc_interrupts
  ret = proc { return 'YEAH BUT I THINK...!' }
  ret.call
  'I respect your opinion, but I disagree based on this well thought facts'
end

def lambda_an_intellectual
  ret = -> { return 'I desire to interrupt, but I will respect my peers' }
  ret.call
  "Thanks for letting me answer, you're trully an intellectual"
end

puts 'Rude proc interrupts:'
puts rude_proc_interrupts

puts "\nLambda, an intellectual, lets her interlocutor carry on:"
puts lambda_an_intellectual
