import 'package:kanggo_flutter_developer_dandy/domain/entity/list_user_response_entity.dart';

class ListUserResponseModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  Support? support;

  ListUserResponseModel(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.support});

  ListUserResponseModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    support =
        json['support'] != null ? new Support.fromJson(json['support']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.support != null) {
      data['support'] = this.support!.toJson();
    }
    return data;
  }

  ListUserResponseEntity toEntity() {
    return ListUserResponseEntity(
        page: page,
        perPage: perPage,
        total: total,
        totalPages: totalPages,
        data: this.data != null
            ? this.data!.map((e) => e.toEntity()).toList()
            : null,
        support: this.support != null ? this.support!.toEntity() : null);
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }

  DataListUserResponseEntity toEntity() {
    return DataListUserResponseEntity(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,
        avatar: avatar);
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }

  SupportListUserResponseEntity toEntity() {
    return SupportListUserResponseEntity(url: url, text: text);
  }
}

class DetailPageArguments {
  final String? imageUrl;
  final String? email;
  final String? name;

  const DetailPageArguments(
      {required this.email, required this.imageUrl, required this.name});
}
