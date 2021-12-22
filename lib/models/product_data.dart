// To parse this JSON data, do
//
//     final productData = productDataFromJson(jsonString);

import 'dart:convert';

ProductData productDataFromJson(String str) =>
    ProductData.fromJson(json.decode(str));

String productDataToJson(ProductData data) => json.encode(data.toJson());

class ProductData {
  ProductData({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<Product> data;
  Links links;
  Meta meta;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
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
    this.id,
    this.name,
    this.code,
    this.category,
    this.zoneId,
    this.zone,
    this.tags,
    this.ratings,
    this.averageRatings,
    this.description,
    this.actualPrice,
    this.salePrice,
    this.unit,
    this.isFavourite,
    this.mediaCollection,
    this.thumbnailMediaUrl,
  });

  int? id;
  String? name;
  String? code;
  Category? category;
  int? zoneId;
  Zone? zone;
  List<Unit>? tags;
  List<Rating>? ratings;
  int? averageRatings;
  String? description;
  int? actualPrice;
  int? salePrice;
  Unit? unit;
  bool? isFavourite;
  List<MediaCollection>? mediaCollection;
  String? thumbnailMediaUrl;

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
        "category": category?.toJson(),
        "zoneId": zoneId,
        "zone": zone?.toJson(),
        "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
        "ratings": List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "averageRatings": averageRatings,
        "description": description,
        "actualPrice": actualPrice,
        "salePrice": salePrice,
        "unit": unit!.toJson(),
        "isFavourite": isFavourite,
        "mediaCollection":
            List<dynamic>.from(mediaCollection!.map((x) => x.toJson())),
        "thumbnailMediaUrl": thumbnailMediaUrl,
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.primaryMediaUrl,
    this.media,
  });

  int? id;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;
  String? primaryMediaUrl;
  List<Media>? media;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        primaryMediaUrl: json["primaryMediaUrl"],
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "primaryMediaUrl": primaryMediaUrl,
        "media": List<dynamic>.from(media!.map((x) => x.toJson())),
      };
}

class Media {
  Media({
    this.id,
    this.modelType,
    this.modelId,
    this.uuid,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.conversionsDisk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.generatedConversions,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? modelType;
  int? modelId;
  String? uuid;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  String? conversionsDisk;
  int? size;
  List<dynamic>? manipulations;
  List<dynamic>? customProperties;
  List<dynamic>? generatedConversions;
  List<dynamic>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        modelType: json["model_type"],
        modelId: json["model_id"],
        uuid: json["uuid"],
        collectionName: json["collection_name"],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: json["mime_type"],
        disk: json["disk"],
        conversionsDisk: json["conversions_disk"],
        size: json["size"],
        manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
        customProperties:
            List<dynamic>.from(json["custom_properties"].map((x) => x)),
        generatedConversions:
            List<dynamic>.from(json["generated_conversions"].map((x) => x)),
        responsiveImages:
            List<dynamic>.from(json["responsive_images"].map((x) => x)),
        orderColumn: json["order_column"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelType,
        "model_id": modelId,
        "uuid": uuid,
        "collection_name": collectionName,
        "name": name,
        "file_name": fileName,
        "mime_type": mimeType,
        "disk": disk,
        "conversions_disk": conversionsDisk,
        "size": size,
        "manipulations": List<dynamic>.from(manipulations!.map((x) => x)),
        "custom_properties":
            List<dynamic>.from(customProperties!.map((x) => x)),
        "generated_conversions":
            List<dynamic>.from(generatedConversions!.map((x) => x)),
        "responsive_images":
            List<dynamic>.from(responsiveImages!.map((x) => x)),
        "order_column": orderColumn,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class MediaCollection {
  MediaCollection({
    this.id,
    this.name,
    this.fileName,
    this.url,
    this.mimeType,
  });

  int? id;
  String? name;
  String? fileName;
  String? url;
  String? mimeType;

  factory MediaCollection.fromJson(Map<String, dynamic> json) =>
      MediaCollection(
        id: json["id"],
        name: json["name"],
        fileName: json["fileName"],
        url: json["url"],
        mimeType: json["mimeType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fileName": fileName,
        "url": url,
        "mimeType": mimeType,
      };
}

class Rating {
  Rating({
    this.id,
    this.rating,
    this.customerServiceRating,
    this.qualityRating,
    this.friendlyRating,
    this.pricingRating,
    this.recommend,
    this.department,
    this.title,
    this.body,
    this.approved,
    this.reviewrateableType,
    this.reviewrateableId,
    this.authorType,
    this.authorId,
    this.createdAt,
    this.updatedAt,
    this.dateFormatted,
  });

  int? id;
  double? rating;
  dynamic? customerServiceRating;
  dynamic? qualityRating;
  dynamic? friendlyRating;
  dynamic? pricingRating;
  String? recommend;
  String? department;
  dynamic? title;
  String? body;
  int? approved;
  String? reviewrateableType;
  int? reviewrateableId;
  String? authorType;
  int? authorId;
  String? createdAt;
  String? updatedAt;
  String? dateFormatted;

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
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
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
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "dateFormatted": dateFormatted,
      };
}

class Unit {
  Unit({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.pivot,
    this.code,
  });

  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;
  Pivot? pivot;
  String? code;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        name: json["name"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "pivot": pivot == null ? null : pivot!.toJson(),
        "code": code,
      };
}

class Pivot {
  Pivot({
    this.productId,
    this.tagId,
  });

  int? productId;
  int? tagId;

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
    this.id,
    this.name,
    this.city,
    this.state,
    this.zipcode,
    this.country,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? name;
  String? city;
  String? state;
  String? zipcode;
  String? country;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        id: json["id"],
        name: json["name"],
        city: json["city"],
        state: json["state"],
        zipcode: json["zipcode"],
        country: json["country"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "country": country,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
      };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic? prev;
  String? next;

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
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

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
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

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
