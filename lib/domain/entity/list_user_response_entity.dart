class ListUserResponseEntity {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<DataListUserResponseEntity>? data;
  SupportListUserResponseEntity? support;

  ListUserResponseEntity(
      {required this.page,
      required this.perPage,
      required this.total,
      required this.totalPages,
      required this.data,
      required this.support});

  ListUserResponseEntity.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <DataListUserResponseEntity>[];
      json['data'].forEach((v) {
        data!.add(new DataListUserResponseEntity.fromJson(v));
      });
    }
    support = json['support'] != null
        ? new SupportListUserResponseEntity.fromJson(json['support'])
        : null;
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
}

class DataListUserResponseEntity {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  DataListUserResponseEntity(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  DataListUserResponseEntity.fromJson(Map<String, dynamic> json) {
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
}

class SupportListUserResponseEntity {
  String? url;
  String? text;

  SupportListUserResponseEntity({required this.url, required this.text});

  SupportListUserResponseEntity.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}
