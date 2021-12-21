// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ProductsData {
  ProductsData({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<Product> data;
  Links links;
  Meta meta;

  factory ProductsData.fromRawJson(String str) =>
      ProductsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.code,
    required this.category,
    required this.zoneId,
    required this.zone,
    required this.tags,
    required this.ratings,
    required this.averageRatings,
    required this.description,
    required this.actualPrice,
    required this.salePrice,
    required this.unit,
    required this.isFavourite,
    required this.mediaCollection,
    required this.thumbnailMediaUrl,
  });

  int id;
  String name;
  String code;
  Category category;
  int zoneId;
  Zone zone;
  List<Unit> tags;
  List<Rating> ratings;
  int averageRatings;
  String description;
  int actualPrice;
  int salePrice;
  Unit unit;
  bool isFavourite;
  List<MediaCollection> mediaCollection;
  String thumbnailMediaUrl;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        category: Category.fromJson(json["category"]),
        zoneId: json["zoneId"],
        zone: Zone.fromJson(json["zone"]),
        tags: List<Unit>.from(json["tags"].map((x) => Unit.fromJson(x))),
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        averageRatings: json["averageRatings"],
        description: json["description"],
        actualPrice: json["actualPrice"],
        salePrice: json["salePrice"],
        unit: Unit.fromJson(json["unit"]),
        isFavourite: json["isFavourite"],
        mediaCollection: List<MediaCollection>.from(
            json["mediaCollection"].map((x) => MediaCollection.fromJson(x))),
        thumbnailMediaUrl: json["thumbnailMediaUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "category": category.toJson(),
        "zoneId": zoneId,
        "zone": zone.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
        "averageRatings": averageRatings,
        "description": description,
        "actualPrice": actualPrice,
        "salePrice": salePrice,
        "unit": unit.toJson(),
        "isFavourite": isFavourite,
        "mediaCollection":
            List<dynamic>.from(mediaCollection.map((x) => x.toJson())),
        "thumbnailMediaUrl": thumbnailMediaUrl,
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.primaryMediaUrl,
    required this.media,
  });

  int id;
  String name;
  Description? description;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String primaryMediaUrl;
  List<Media> media;

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: descriptionValues.map[json["description"]],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        primaryMediaUrl: json["primaryMediaUrl"],
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": descriptionValues.reverse[description],
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "primaryMediaUrl": primaryMediaUrl,
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}

enum Description { WRITE_YOU_DESCRIPTION_HERE }

final descriptionValues = EnumValues(
    {"Write you description here": Description.WRITE_YOU_DESCRIPTION_HERE});

class Media {
  Media({
    required this.id,
    required this.modelType,
    required this.modelId,
    required this.uuid,
    required this.collectionName,
    required this.name,
    required this.fileName,
    required this.mimeType,
    required this.disk,
    required this.conversionsDisk,
    required this.size,
    required this.manipulations,
    required this.customProperties,
    required this.generatedConversions,
    required this.responsiveImages,
    required this.orderColumn,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  ModelType? modelType;
  int modelId;
  String uuid;
  CollectionName? collectionName;
  String name;
  String fileName;
  MimeType? mimeType;
  Disk? disk;
  Disk? conversionsDisk;
  int size;
  List<dynamic> manipulations;
  List<dynamic> customProperties;
  List<dynamic> generatedConversions;
  List<dynamic> responsiveImages;
  int orderColumn;
  DateTime createdAt;
  DateTime updatedAt;

  factory Media.fromRawJson(String str) => Media.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        modelType: modelTypeValues.map[json["model_type"]],
        modelId: json["model_id"],
        uuid: json["uuid"],
        collectionName: collectionNameValues.map[json["collection_name"]],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: mimeTypeValues.map[json["mime_type"]],
        disk: diskValues.map[json["disk"]],
        conversionsDisk: diskValues.map[json["conversions_disk"]],
        size: json["size"],
        manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
        customProperties:
            List<dynamic>.from(json["custom_properties"].map((x) => x)),
        generatedConversions:
            List<dynamic>.from(json["generated_conversions"].map((x) => x)),
        responsiveImages:
            List<dynamic>.from(json["responsive_images"].map((x) => x)),
        orderColumn: json["order_column"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelTypeValues.reverse[modelType],
        "model_id": modelId,
        "uuid": uuid,
        "collection_name": collectionNameValues.reverse[collectionName],
        "name": name,
        "file_name": fileName,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "disk": diskValues.reverse[disk],
        "conversions_disk": diskValues.reverse[conversionsDisk],
        "size": size,
        "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
        "custom_properties": List<dynamic>.from(customProperties.map((x) => x)),
        "generated_conversions":
            List<dynamic>.from(generatedConversions.map((x) => x)),
        "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
        "order_column": orderColumn,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum CollectionName { PRIMARY }

final collectionNameValues = EnumValues({"primary": CollectionName.PRIMARY});

enum Disk { S3 }

final diskValues = EnumValues({"s3": Disk.S3});

enum MimeType { IMAGE_PNG, IMAGE_JPEG }

final mimeTypeValues = EnumValues(
    {"image/jpeg": MimeType.IMAGE_JPEG, "image/png": MimeType.IMAGE_PNG});

enum ModelType { APP_MODELS_CATEGORY }

final modelTypeValues =
    EnumValues({"App/Models/Category": ModelType.APP_MODELS_CATEGORY});

class MediaCollection {
  MediaCollection({
    required this.id,
    required this.name,
    required this.fileName,
    required this.url,
    required this.mimeType,
  });

  int id;
  String name;
  String fileName;
  String url;
  MimeType? mimeType;

  factory MediaCollection.fromRawJson(String str) =>
      MediaCollection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MediaCollection.fromJson(Map<String, dynamic> json) =>
      MediaCollection(
        id: json["id"],
        name: json["name"],
        fileName: json["fileName"],
        url: json["url"],
        mimeType: mimeTypeValues.map[json["mimeType"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fileName": fileName,
        "url": url,
        "mimeType": mimeTypeValues.reverse[mimeType],
      };
}

class Rating {
  Rating({
    required this.id,
    required this.rating,
    required this.customerServiceRating,
    required this.qualityRating,
    required this.friendlyRating,
    required this.pricingRating,
    required this.recommend,
    required this.department,
    required this.title,
    required this.body,
    required this.approved,
    required this.reviewrateableType,
    required this.reviewrateableId,
    required this.authorType,
    required this.authorId,
    required this.createdAt,
    required this.updatedAt,
    required this.dateFormatted,
  });

  int id;
  double rating;
  dynamic customerServiceRating;
  dynamic qualityRating;
  dynamic friendlyRating;
  dynamic pricingRating;
  String recommend;
  String department;
  dynamic title;
  String body;
  int approved;
  String reviewrateableType;
  int reviewrateableId;
  String authorType;
  int authorId;
  DateTime createdAt;
  DateTime updatedAt;
  String dateFormatted;

  factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        rating: json["rating"].toDouble(),
        customerServiceRating: json["customerServiceRating"],
        qualityRating: json["qualityRating"],
        friendlyRating: json["friendlyRating"],
        pricingRating: json["pricingRating"],
        recommend: json["recommend"],
        department: json["department"],
        title: json["title"],
        body: json["body"],
        approved: json["approved"],
        reviewrateableType: json["reviewrateableType"],
        reviewrateableId: json["reviewrateableId"],
        authorType: json["authorType"],
        authorId: json["authorId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        dateFormatted: json["dateFormatted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "customerServiceRating": customerServiceRating,
        "qualityRating": qualityRating,
        "friendlyRating": friendlyRating,
        "pricingRating": pricingRating,
        "recommend": recommend,
        "department": department,
        "title": title,
        "body": body,
        "approved": approved,
        "reviewrateableType": reviewrateableType,
        "reviewrateableId": reviewrateableId,
        "authorType": authorType,
        "authorId": authorId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "dateFormatted": dateFormatted,
      };
}

class Unit {
  Unit({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.pivot,
    required this.code,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Pivot? pivot;
  String code;

  factory Unit.fromRawJson(String str) => Unit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "pivot": pivot == null ? null : pivot?.toJson(),
        "code": code,
      };
}

class Pivot {
  Pivot({
    required this.productId,
    required this.tagId,
  });

  int productId;
  int tagId;

  factory Pivot.fromRawJson(String str) => Pivot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        productId: json["product_id"],
        tagId: json["tag_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "tag_id": tagId,
      };
}

class Zone {
  Zone({
    required this.id,
    required this.name,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.country,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  String name;
  String city;
  String state;
  String zipcode;
  String country;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Zone.fromRawJson(String str) => Zone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        id: json["id"],
        name: json["name"],
        city: json["city"],
        state: json["state"],
        zipcode: json["zipcode"],
        country: json["country"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "country": country,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  String first;
  String last;
  dynamic prev;
  String next;

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromRawJson(String str) => Link.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    // reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
