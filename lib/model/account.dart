class Account {
  Item item;
  int error;
  String message;

  Account({this.item, this.error, this.message});

  Account.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item.toJson();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class Item {
  String id;
  String userName;
  String email;
  String imageUrl;
  String phoneNumber;
  int roboCoin;
  String groupName;
  String token;
  String lastLogin;
  Null isFollowed;
  bool isAdmin;

  Item(
      {this.id,
      this.userName,
      this.email,
      this.imageUrl,
      this.phoneNumber,
      this.roboCoin,
      this.groupName,
      this.token,
      this.lastLogin,
      this.isFollowed,
      this.isAdmin});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    phoneNumber = json['phoneNumber'];
    roboCoin = json['roboCoin'];
    groupName = json['groupName'];
    token = json['token'];
    lastLogin = json['lastLogin'];
    isFollowed = json['isFollowed'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['imageUrl'] = this.imageUrl;
    data['phoneNumber'] = this.phoneNumber;
    data['roboCoin'] = this.roboCoin;
    data['groupName'] = this.groupName;
    data['token'] = this.token;
    data['lastLogin'] = this.lastLogin;
    data['isFollowed'] = this.isFollowed;
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}
