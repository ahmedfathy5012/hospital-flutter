class Role{
  int id;
  String title;

  Role({this.id,this.title});

  Role.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['role_id'];
    this.title=jsonObject['role_name'];
  }
  Role.fromSQFLITE(Map<String,dynamic> jsonObject){
    this.id=jsonObject['id'];
    this.title=jsonObject['title'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'role_id': id,
      'role_name': title
    };
    return map;
  }
}