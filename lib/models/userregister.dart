

class UserRegisterModel{
  int id;
  String fullnameController;
  String phoneController;
  String emailController;
  String usernmController;
  String pwdController;
  String role;
  String userstatus;
  String userimage;
  int log_id;

  UserRegisterModel(
      {required this.id,
      required this.fullnameController,
      required this.phoneController,
      required this.emailController,
        required this.usernmController,
        required this.pwdController,
        required this.role,
        required this.userstatus,
        required this.userimage,
        required this.log_id});

  factory UserRegisterModel.fromJson(Map<String, dynamic> json){
    return UserRegisterModel(
      id: json['id']==null?0:json['id'],
      fullnameController: json['fullnameController']==null?'':json['fullnameController'],
      phoneController: json['phoneController']==null?'':json['phoneController'],
      emailController: json['emailController']==null?'':json['emailController'],
      usernmController: json['usernmController'],
      pwdController: json['pwdController'],
      role: json['role'],
      userstatus: json['userstatus'],
      userimage: json['userimage'],
      log_id: json['log_id']
    );
  }
}