class Newsfeed {
  String id;
  String userName;
  String userId;
  String userImageUrl;
  String imageUrl;
  String createdTime;
  String content;
  int type;
  int likeCount;
  int commentCount;
  bool isLiked;
  bool isEditable;
  List<Tags> tags;

  Newsfeed(
      {this.id,
      this.userName,
      this.userId,
      this.userImageUrl,
      this.imageUrl,
      this.createdTime,
      this.content,
      this.type,
      this.likeCount,
      this.commentCount,
      this.isLiked,
      this.isEditable,
      this.tags});

  Newsfeed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    userId = json['userId'];
    userImageUrl = json['userImageUrl'];
    imageUrl = json['imageUrl'];
    createdTime = json['createdTime'];
    content = json['content'];
    type = json['type'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    isLiked = json['isLiked'];
    isEditable = json['isEditable'];
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['userId'] = this.userId;
    data['userImageUrl'] = this.userImageUrl;
    data['imageUrl'] = this.imageUrl;
    data['createdTime'] = this.createdTime;
    data['content'] = this.content;
    data['type'] = this.type;
    data['likeCount'] = this.likeCount;
    data['commentCount'] = this.commentCount;
    data['isLiked'] = this.isLiked;
    data['isEditable'] = this.isEditable;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  String id;
  String name;

  Tags({this.id, this.name});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
