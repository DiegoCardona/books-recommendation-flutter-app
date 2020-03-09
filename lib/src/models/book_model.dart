class BooksListModel {
  final List<BookModel> books;

  BooksListModel({
    this.books,
  });

  factory BooksListModel.fromJson(Map<String, dynamic> parsedJson) {
    var newJson = parsedJson['items'] as List;
    List<BookModel> books =  newJson.map((i) => BookModel.fromJson(i)).toList();

    return new BooksListModel(
        books: books
    );
  }
}

class BookModel {
  final String id;
  final String title;
  final String publishedDate;
  final String description;
  final String smallThumbnail;
  final String thumbnail;
  final int pageCount;
  final int averageRating;
  final List<dynamic> authors;
  final List<dynamic> categories;

  BookModel({
    this.id,
    this.title,
    this.authors,
    this.averageRating,
    this.categories,
    this.description,
    this.pageCount,
    this.publishedDate,
    this.smallThumbnail,
    this.thumbnail
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        id: json['id'],
        title: json['volumeInfo']['title'],
        authors: json['volumeInfo']['authors'],
        averageRating: json['averageRating'],
        categories: json['categories'],
        description: json['description'],
        pageCount: json['pageCount'],
        publishedDate: json['publishedDate'],
        smallThumbnail: json['volumeInfo']['imageLinks']['smallThumbnail'],
        thumbnail: json['volumeInfo']['imageLinks']['thumbnail']
    );
  }
}