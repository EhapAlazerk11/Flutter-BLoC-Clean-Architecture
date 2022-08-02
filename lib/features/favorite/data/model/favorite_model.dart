import 'package:equatable/equatable.dart';


typedef FavoritesList = List<Favorite>? ;

class FavoriteDataBean {
  FavoriteDataBean({
    this.error,
    this.message,
    this.data,
  });

  FavoriteDataBean.fromJson(dynamic json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Favorite.fromJson(v));
      });
    }
  }

  bool? error;
  String? message;
  List<Favorite>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Favorite extends Equatable {
  Favorite({
    this.id,
    this.name,
    this.nameAr,
    this.phone,
    this.description,
    this.descriptionAr,
    this.lng,
    this.lat,
    this.address,
    this.fees,
    this.waitingTime,
    this.active,
    this.countryId,
    this.category,
    this.image,
    this.rate,
    this.firstTime,
    this.isFav,
    this.tablesNumber,
    this.tableMaxNumber,
    this.maxReservationCount,
    this.attached,
  });

  Favorite.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    phone = json['phone'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    lng = json['lng'];
    lat = json['lat'];
    address = json['address'];
    fees = json['fees'];
    waitingTime = json['waiting_time'];
    active = json['active'];
    countryId = json['country_id'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    image = json['image '];
    rate = json['rate'];
    firstTime = json['first_time'];
    isFav = json['is_fav'];
    tablesNumber = json['tables_number'];
    tableMaxNumber = json['table_max_number'];
    maxReservationCount = json['max_reservation_count'];
    attached = json['attached '];
  }

  int? id;
  String? name;
  String? nameAr;
  String? phone;
  String? description;
  String? descriptionAr;
  String? lng;
  String? lat;
  String? address;
  String? fees;
  String? waitingTime;
  String? active;
  String? countryId;
  Category? category;
  String? image;
  String? rate;
  bool? firstTime;
  bool? isFav;
  String? tablesNumber;
  String? tableMaxNumber;
  int? maxReservationCount;
  String? attached;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['name_ar'] = nameAr;
    map['phone'] = phone;
    map['description'] = description;
    map['description_ar'] = descriptionAr;
    map['lng'] = lng;
    map['lat'] = lat;
    map['address'] = address;
    map['fees'] = fees;
    map['waiting_time'] = waitingTime;
    map['active'] = active;
    map['country_id'] = countryId;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['image '] = image;
    map['rate'] = rate;
    map['first_time'] = firstTime;
    map['is_fav'] = isFav;
    map['tables_number'] = tablesNumber;
    map['table_max_number'] = tableMaxNumber;
    map['max_reservation_count'] = maxReservationCount;
    map['attached '] = attached;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        nameAr,
        phone,
        description,
        descriptionAr,
        lng,
        lat,
        address,
        fees,
        waitingTime,
        address,
        countryId,
        image,
        attached,
        isFav
      ];
}

class Category extends Equatable {
  Category({
    this.id,
    this.name,
    this.nameAr,
    this.image,
  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
  }

  int? id;
  String? name;
  String? nameAr;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['name_ar'] = nameAr;
    map['image'] = image;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, nameAr, image];
}
