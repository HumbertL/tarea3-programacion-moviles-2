class Book {
  final String title;
  final String pages;
  final String releaseddate;
  final String imagelink;
  final String description;
  final String booklink;

  Book(this.title, this.releaseddate, this.imagelink, this.description,
      this.pages, this.booklink);
  Book.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        imagelink = json['imageLinks'] != null
            ? json['imageLinks']['thumbnail']
            : "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg",
        description =
            json['description'] != null ? json['description'] : "Empty",
        releaseddate = json['publishedDate'],
        pages = json['pagecount'].toString(),
        booklink = json['canonicalVolumeLink'];
}
