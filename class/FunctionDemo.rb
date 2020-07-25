
class Sample
  def hello
    puts "Hello Ruby!"
  end
  def hello1(name)
    puts "Hello,#{name}!"
  end
end

object=Sample.new
object.hello
object.hello1("John")