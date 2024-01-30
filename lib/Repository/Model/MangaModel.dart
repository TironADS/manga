class MangaModel {
  MangaModel({
      this.code, 
      this.data,});

  MangaModel.fromJson(dynamic json) {
    code = json['code'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? code;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.title, 
      this.subTitle, 
      this.status, 
      this.thumb, 
      this.summary, 
      this.authors, 
      this.genres, 
      this.nsfw, 
      this.type, 
      this.totalChapter, 
      this.createAt, 
      this.updateAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['sub_title'];
    status = json['status'];
    thumb = json['thumb'];
    summary = json['summary'];
    authors = json['authors'] != null ? json['authors'].cast<String>() : [];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    nsfw = json['nsfw'];
    type = json['type'];
    totalChapter = json['total_chapter'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
  }
  String? id;
  String? title;
  String? subTitle;
  String? status;
  String? thumb;
  String? summary;
  List<String>? authors;
  List<String>? genres;
  bool? nsfw;
  String? type;
  int? totalChapter;
  int? createAt;
  int? updateAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['sub_title'] = subTitle;
    map['status'] = status;
    map['thumb'] = thumb;
    map['summary'] = summary;
    map['authors'] = authors;
    map['genres'] = genres;
    map['nsfw'] = nsfw;
    map['type'] = type;
    map['total_chapter'] = totalChapter;
    map['create_at'] = createAt;
    map['update_at'] = updateAt;
    return map;
  }

}