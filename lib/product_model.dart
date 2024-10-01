// class ProductModel {
//   final int id;
//   final String title;
//   final String description;
//   final String category;
//   // final double price;
//   // final double discountPercentage;
//   // final double rating;
//   //  int? stock;
//   // final List<String> tags;
//   // final String brand;
//   // final String sku;
//   // final double weight;
//   // final Dimensions? dimensions;
//   // final String warrantyInformation;
//   // final String shippingInformation;
//   // final String availabilityStatus;
//   // final List<Review> reviews;
//   // final String returnPolicy;
//   // final int minimumOrderQuantity;
//   // final String thumbnail;
//   // final List<String> images;
//   // final Meta meta;

//   ProductModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.category,
//     required this.stock,
//     // required this.price,
//     // required this.discountPercentage,
//     // required this.rating,
//     // required this.stock,
//     // required this.tags,
//     // required this.brand,
//     // required this.sku,
//     // required this.weight,
//     // this.dimensions,
//     // required this.warrantyInformation,
//     // required this.shippingInformation,
//     // required this.availabilityStatus,
//     // required this.reviews,
//     // required this.returnPolicy,
//     // required this.minimumOrderQuantity,
//     // required this.thumbnail,
//     // required this.images,
//     // required this.meta,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json['id'],
//       title: json['title'],
//       description: json['description'],
//       category: json['category'],
//       stock: json['stock'],

//       // price: json['price'].toDouble(),
//       // discountPercentage: json['discountPercentage'].toDouble(),
//       // rating: json['rating'].toDouble(),
//       // stock: json['stock'],
//       // tags: List<String>.from(json['tags']),
//       // brand: json['brand'],
//       // sku: json['sku'],
//       // weight: json['weight'].toDouble(),
//       // dimensions: json['dimensions'] != null
//       //     ? Dimensions.fromJson(json['dimensions'])
//       //     : null,
//       // warrantyInformation: json['warrantyInformation'],
//       // shippingInformation: json['shippingInformation'],
//       // availabilityStatus: json['availabilityStatus'],
//       // reviews: (json['reviews'] as List<dynamic>)
//       //     .map((review) => Review.fromJson(review))
//       //     .toList(),
//       // returnPolicy: json['returnPolicy'],
//       // minimumOrderQuantity: json['minimumOrderQuantity'],
//       // thumbnail: json['thumbnail'],
//       // images: List<String>.from(json['images']),
//       // meta: Meta.fromJson(json['meta']),
//     );
//   }
// }

// // class Dimensions {
// //   final double width;
// //   final double height;
// //   final double depth;

// //   Dimensions({required this.width, required this.height, required this.depth});

// //   factory Dimensions.fromJson(Map<String, dynamic> json) {
// //     return Dimensions(
// //       width: json['width'].toDouble(),
// //       height: json['height'].toDouble(),
// //       depth: json['depth'].toDouble(),
// //     );
// //   }
// // }

// // class Review {
// //   final int rating;
// //   final String comment;
// //   final DateTime date;
// //   final String reviewerName;
// //   final String reviewerEmail;

// //   Review({
// //     required this.rating,
// //     required this.comment,
// //     required this.date,
// //     required this.reviewerName,
// //     required this.reviewerEmail,
// //   });

// //   factory Review.fromJson(Map<String, dynamic> json) {
// //     return Review(
// //       rating: json['rating'],
// //       comment: json['comment'],
// //       date: DateTime.parse(json['date']),
// //       reviewerName: json['reviewerName'],
// //       reviewerEmail: json['reviewerEmail'],
// //     );
// //   }
// // }

// // class Meta {
// //   final DateTime createdAtfinal;
// //   final DateTime updatedAt;
// //   final String barcode;
// //   final String qrCode;

// //   Meta({
// //     required this.createdAt,
// //     required this.updatedAt,
// //     required this.barcode,
// //     required this.qrCode,
// //   });

// //   factory Meta.fromJson(Map<String, dynamic> json) {
// //     return Meta(
// //       createdAt: DateTime.parse(json['createdAt']),
// //       updatedAt: DateTime.parse(json['updatedAt']),
// //       barcode: json['barcode'],
// //       qrCode: json['qrCode'],
// //     );
// //   }
// // }
class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  int quantity; 

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.quantity = 0, // Default quantity to 0
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
    );
  }
}
