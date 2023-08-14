class femalee
{
  bool? clothes;
  String? name;
  String? dropvalue;
  String? gender;
  String? uid;
  String? phone;
  String? mobile;
  String? govern;
  String? qualify;
  String? job;
  String? age;
  String? birthday;
  String? healthy;
  bool?male;
  bool?king;
  String?image;
  bool?money;
  String ?userid;


  femalee({
    this.phone,
    this.king,
    this.name,
    this.gender,
    this.dropvalue,
    this.clothes,
    this.uid,
    this.mobile,
    this.govern,
    this.qualify,
    this.job,
    this.age,
    this.birthday,
    this.male,
    this.healthy,
    this.image,
    this.money,
    this.userid,
  });
  femalee.fromJson(Map<String,dynamic>json)
  {
    uid=json['uid'];
    clothes=json['clothes'];
    name=json['name'];
    king=json['king'];
    dropvalue=json['dropvalue'];
    gender=json['gender'];
    mobile=json['mobile'];
    phone=json['phone'];
    govern=json['govern'];
    qualify=json['qualify'];
    job=json['job'];
    age=json['age'];
    birthday=json['birthday'];
    male=json['male'];
    healthy=json['healthy'];
    image=json['image'];
    money=json['money'];
    userid=json['userid'];

  }
  Map<String,dynamic>toMap()
  {
    return {
      'uid':uid,
      'clothes':clothes,
      'gender':gender,
      'name':name,
      'dropvalue':dropvalue,
      'mobile':mobile,
      'phone':phone,
      'govern':govern,
      'qualify':qualify,
      'job':job,
      'age':age,
      'birthday':birthday,
      'male':male,
      'healthy':healthy,
      'image':image,
      'king':king,
      'money':money,
      'userid':userid,



    };
  }
}