// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library jsonify.example;

import 'package:jsonify/jsonify.dart';
import 'dart:convert';

class Book extends Object with Jsonify {
  
  @JsonProperty("author-name")
  String author;
  
  String title;
  
  @JsonIgnore()
  String isbn;
  
  Book(this.author, this.title, this.isbn);
}

main() {
  Book book = new Book("JK Rowling", "Harry Potter", "1232213343221");
  var jsonBook = jsonEncode(book);
  print('book: ${jsonBook}');
}
