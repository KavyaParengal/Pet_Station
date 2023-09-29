class NotificationModel {
  int? id;
  int? userId;
  int? orderId;
  String? notificationContent;
  String? notificationTitle;
  String? date;
  String? notificationStatus;

  NotificationModel(
      {this.id,
        this.userId,
        this.orderId,
        this.notificationContent,
        this.notificationTitle,
        this.date,
        this.notificationStatus});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderId = json['order_id'];
    notificationContent = json['notification_content'];
    notificationTitle = json['notification_title'];
    date = json['date'];
    notificationStatus = json['notification_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['notification_content'] = this.notificationContent;
    data['notification_title'] = this.notificationTitle;
    data['date'] = this.date;
    data['notification_status'] = this.notificationStatus;
    return data;
  }
}