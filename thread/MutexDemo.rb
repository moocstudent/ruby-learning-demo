require 'thread'
puts "Synchronize Thread"

@num = 200
@mutex = Mutex.new

def buyTicket(num)
  @mutex.lock
  # 不一定非要格式化
  if @num >= num
    @num -= num
    puts "You have successfully bought #{num} tickets"
  else
    puts "Sorry,no enough tickets"
  end
  @mutex.unlock
end

ticket1=Thread.new 10 do
  10.times do |value|
    ticketNum=15
    buyTicket(ticketNum)
    sleep 0.01
  end
end

ticket2=Thread.new 10 do
  10.times do |value|
    ticketNum = 20
    buyTicket(ticketNum)
    sleep 0.01
  end
end

sleep 1
ticket1.join
ticket2.join