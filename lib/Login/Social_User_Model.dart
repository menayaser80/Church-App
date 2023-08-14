class ChatUserModel
{
  String? name;
  String? email;
  String? phone;
  String? uid;
  ChatUserModel({
    this.name,
    this.email,
    this.phone,
    this.uid,
  });
  ChatUserModel.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    uid=json['uid'];
  }
  Map<String,dynamic>toMap()
  {
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uid':uid,
    };
  }
}