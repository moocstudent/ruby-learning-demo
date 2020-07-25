# 线程可以有其私有变量，线程的私有变量在线程创建的时候写入线程。可以被线程范围内使用，但是不能被线程外部进行共享。
# 但是有时候，线程的局部变量需要别别的线程或者主线程访问怎么办？ruby当中提供了允许通过名字来创建线程变量，类似的把线程看做hash式的散列表。
# 通过[]=写入并通过[]读出数据。我们来看一下下面的代码：

count = 0
arr = []

10.times do |i|
  arr[i] = Thread.new{
    sleep(rand(0)/10.0)
    Thread.current["mycount"]=count
    count+=1
  }
end

arr.each { |e| e.join; print e["mycount"],"," }
puts "count = #{count}"