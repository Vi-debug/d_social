import 'package:d_social/model/newsfeed.dart';

class ApiRespone {
  List<Newsfeed> listNewsfeed;
  int error;
  String message;

  ApiRespone({this.listNewsfeed, this.error, this.message});

  ApiRespone.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      listNewsfeed = new List<Newsfeed>();
      json['items'].forEach((v) {
        listNewsfeed.add(new Newsfeed.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listNewsfeed != null) {
      data['items'] = this.listNewsfeed.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}
