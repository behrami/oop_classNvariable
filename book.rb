class Book

  @@on_shelf=[]
  @@on_loan=[]

  def initialize(title, author, isbn)
    @title=title
    @author=author
    @isbn=isbn
  end

  def due_date
    return due_date
  end

  def due_date=(due_date)
    @due_date=due_date
  end

  def borrow

  end

  def return_to_library

  end

  def lent_out
    @@on_shelf.each do |book|
      if isbn == book.isbn
        return true
      end
    end
    return false
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

p Book.available

p newbook2.borrowed

p Book.browse

p newbook2.lent_out

p Book.current_due_date
