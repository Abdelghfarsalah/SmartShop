class productmodel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  bool isactive = false;
  bool cart = false;

  productmodel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory productmodel.fromjson(data) {
    return productmodel(
        id: data["id"],
        title: data["title"],
        price: data["price"],
        description: data["description"],
        category: data["category"],
        image: data["image"],
        rating: Rating.fromjason(data["rating"]));
  }
}

class Rating {
  final dynamic rate;
  final dynamic count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromjason(data) {
    return Rating(rate: data["rate"], count: data["count"]);
    ;
  }
}
