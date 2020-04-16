class PersonExtension{
  int id;
  String name;
  String content;
  PersonExtension({this.id,this.name,this.content});
  PersonExtension.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['id'];
    this.name=jsonObject['name'];
    this.content=jsonObject['content'];
  }
}