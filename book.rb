class Book

  @@on_shelf=[]
  @@on_loan=[]

  def initialize(title, author, isbn)
    @title=title
    @author=author
    @isbn=isbn
  end

  def due_date
    return @due_date
  end

  def due_date=(due_date)
    @due_date=due_date
  end

  def borrow
    if lend_out? == false
      @due_date=Book.current_due_date
      loaning=@@on_shelf.delete(self)############################  help me
      @@on_loan.push(loaning)
      return true
    else
      return false
    end
  end

  def return_to_library
    if lend_out?
      @due_date= nil
      depositing=@@on_loan.delete(self)############################  help me
      @@on_shelf.push(depositing)
      return true
    else
      return false
    end
  end

  def lend_out?
    if @@on_shelf.include?(self)
      return false
    else
      return true
    end

  end

  def isbn
    return @isbn
  end

  def self.create(author, title, isbn)
    book_add = Book.new(author, title, isbn)
    @@on_shelf.push(book_add)
    return book_add
  end

  def self.current_due_date
      return Time.now+(60*60*24*7)
  end

  def self.overdue_books

    @@on_loan.each do |bookOBJ|
      if bookOBJ.due_date < Time.now
        return bookOBJ
      end
    end
  end

  def self.browse
    return @@on_shelf.sample
  end

  def self.available
    return @@on_shelf
  end

  def borrowed
    return @@on_loan
  end

end

newbook=Book.create("guuci gang", "lil pump", "420b")
p newbook
newbook2=Book.create("guuci gang2", "lil pump2", "420b2")
p newbook2
newbook3=Book.create("guuci gang3", "lil pump3", "420b3")
p newbook3
puts

p Book.available #list all available books in library
puts

p newbook2.borrowed#returns all the books that were borrowed aka not in library
puts

p Book.browse#list random book in library
puts

p newbook3.lend_out? #returns true if the books is not in library false if it is in library
puts

p newbook3.borrow#borrow book3
puts

p newbook3.lend_out?
puts

# p Book.current_due_date
# puts
# p newbook3.borrow
# puts
# p newbook3.borrow
# puts
p newbook3.due_date
puts
p newbook3.borrowed
puts

# p newbook3.return_to_library
# puts
# p newbook3.return_to_library
# puts
p Book.overdue_books
puts
