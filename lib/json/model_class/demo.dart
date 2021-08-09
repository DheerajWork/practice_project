
class DemoClass {
  String? name;
  int? id;

  DemoClass({this.name,this.id});

  DemoClass.fromjson(Map<String, dynamic> json){
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> tojson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
