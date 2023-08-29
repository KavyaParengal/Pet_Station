

class PetAppModel{
  String? id;
  String? fullnameController;
  String? phoneController;
  String? emailController;
  String? usernmController;
  String? pwdController;
  String? role;
  String? userstatus;
  String? userimage;
  String? log_id;

  PetAppModel(
      {this.id,
      this.fullnameController,
      this.phoneController,
      this.emailController,
      this.usernmController,
      this.pwdController,
      this.role,
      this.userstatus,
      this.userimage,
      this.log_id});

  factory PetAppModel.fromJson(Map<String, dynamic> json){
    return PetAppModel(
      id: json['id'],
      fullnameController: json['fullnameController'],
      phoneController: json['phoneController'],
      emailController: json['emailController'],
      usernmController: json['usernmController'],
      pwdController: json['pwdController'],
      role: json['role'],
      userstatus: json['userstatus'],
      userimage: json['userimage'],
      log_id: json['log_id']
    );
  }
}