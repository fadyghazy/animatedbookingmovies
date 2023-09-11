class Product {
  final String productName;
  final String productImage;

  const Product({
    required this.productName,
    required this.productImage,
  });
}

class Category {
  final String categoryName;
  final String productCount;
  final String thumbnailImage;

  const Category({
    required this.categoryName,
    required this.productCount,
    required this.thumbnailImage,
  });
}

// list of categories
final categories = [
  const Category(
    categoryName: "T-SHIRT",
    productCount: "240",
    thumbnailImage:
        "https://images.unsplash.com/photo-1576871337622-98d48d1cf531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ),
  const Category(
    categoryName: "SHOES",
    productCount: "120",
    thumbnailImage:
        "https://images.unsplash.com/photo-1595341888016-a392ef81b7de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1179&q=80",
  ),
  const Category(
    categoryName: "HODDIE",
    productCount: "200",
    thumbnailImage:
        "https://images.unsplash.com/photo-1647771746277-eac927afab2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ),
  const Category(
    categoryName: "JEANS",
    productCount: "240",
    thumbnailImage:
        "https://images.unsplash.com/photo-1576995853123-5a10305d93c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  ),
];

// list of products
final products = [
  const Product(
    productName: "Addidas Sneaker",
    productImage:
        "assets/images/addidas_sneaker1.png",
  ),
  const Product(
    productName: "Jordon Sneaker",
    productImage:
        "assets/images/jordonsneaker02.png",
  ),
  const Product(
    productName: "Reebok Sneaker ",
    productImage:
        "assets/images/newreeboksneaker01.png",
  ),
  const Product(
    productName: "Puma Sneaker",
    productImage:
        "assets/images/pumasneaker02.png",
  ),
  const Product(
    productName: "Upcoming Addidas Sneaker",
    productImage:
        "assets/images/upcomingaddidassneaker04.png",
  ),
  const Product(
    productName: "Upcoming Puma Sneaker ",
    productImage:
        "assets/images/upcomingpumasneaker03.png",
  ),
  const Product(
    productName: "Upcoming Reebok Sneaker",
    productImage:
        "assets/images/upcomingreeboksneakers03.png",
  ),
  const Product(
    productName: "Upcoming Addidas Sneaker ",
    productImage:
        "assets/images/newaddidassneaker02.png",
  ),
];
