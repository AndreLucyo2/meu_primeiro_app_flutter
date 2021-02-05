class Item {
  String title; //titulo
  bool done; //se esta feito

  Item({this.title, this.done});

  //converte um json: video 5 https://youtu.be/1Ke4cB8K4Q4?list=PLHlHvK2lnJndhgbqLl5DNEvKQg5F4ZenQ&t=249

  //Gerador de json to dart: https://javiercbk.github.io/json_to_dart/

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    //constante:
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['done'] = this.done;
    return data;
  }
}
