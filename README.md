# jsonify

A library that helps a developer to turn a object into a json representation

## Usage

First of all you can create an object like this:

    class Book extends Object with Jsonify {
  
      @JsonProperty("author-name")
      String author;
      
      String title;
      
      @JsonIgnore()
      String isbn;
      
      Book(this.author, this.title, this.isbn);
    }

Then you can create an object and encode it into json:

    Book book = new Book("JK Rowling", "Harry Potter", "1232213343221");
    var jsonBook = jsonEncode(book);

## Contributing
 
If you found a bug, just create a new issue or even better fork and issue a
pull request with you fix.
