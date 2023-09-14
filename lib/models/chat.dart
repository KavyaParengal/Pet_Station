class ChatModel {
  Data? data;
  String? message;
  bool? success;

  ChatModel({this.data, this.message, this.success});

  ChatModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int? id;
  String? uname;
  String? message;
  String? reply;
  String? chatstatus;
  int? user;

  Data(
      {this.id,
        this.uname,
        this.message,
        this.reply,
        this.chatstatus,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uname = json['uname'];
    message = json['message'];
    reply = json['reply'];
    chatstatus = json['chatstatus'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uname'] = this.uname;
    data['message'] = this.message;
    data['reply'] = this.reply;
    data['chatstatus'] = this.chatstatus;
    data['user'] = this.user;
    return data;
  }
}