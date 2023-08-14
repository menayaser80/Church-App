class Childrenmodel
{
  String? uid;
  String? dropvalue;
  String? name;
  String? term;
  String? university;
  String? state;
  String? qualify;
  String?male;
  bool?money;
  String? govern;
  String? age;
  String? phone;
  String? birthday;
  String? healthy;
  bool? food;
  bool? clothes;
  bool?king;
  String?image;
  String ?userid;

  Childrenmodel({
this.qualify,
    this.age,
    this.king,
    this.healthy,
    this.phone,
    this.govern,
    this.male,
    this.name,
    this.uid,
    this.image,
    this.dropvalue,
    this.birthday,
    this.state,
    this.clothes,
    this.food,
    this.money,
    this.term,
    this.university,
    this.userid,
  });
  Childrenmodel.fromJson(Map<String,dynamic>json)
  {
    uid=json['uid'];
    clothes=json['clothes'];
    name=json['name'];
    king=json['king'];
    dropvalue=json['dropvalue'];
    state=json['state'];
    food=json['food'];
    phone=json['phone'];
    govern=json['govern'];
    qualify=json['qualify'];
    term=json['term'];
    age=json['age'];
    birthday=json['birthday'];
    male=json['male'];
    healthy=json['healthy'];
    image=json['image'];
    money=json['money'];
    university=json['university'];
    userid=json['userid'];




  }
  Map<String,dynamic>toMap()
  {
    return {
      'uid':uid,
      'clothes':clothes,
      'university':university,
      'name':name,
      'dropvalue':dropvalue,
      'term':term,
      'phone':phone,
      'govern':govern,
      'qualify':qualify,
      'food':food,
      'age':age,
      'birthday':birthday,
      'male':male,
      'healthy':healthy,
      'image':image,
      'king':king,
      'money':money,
      'state':state,
      'userid':userid,
    };
  }
}