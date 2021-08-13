

class PrefModelClass {
  int? a = 0;


  PrefModelClass({this.a});

  PrefModelClass.fromjson(Map<String, dynamic> json){
    a = json["a"];
  }

  Map<String, dynamic> tojson(){
   final Map<String, dynamic> data = Map<String, dynamic>();
    data["a"] = a;
    return data;
  }

}

