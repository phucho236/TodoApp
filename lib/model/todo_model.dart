class TodoModel {
  String id;
  bool complete;
  String note;
  TodoModel({this.id, this.note, this.complete});
  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    complete = json["complete"];
    note = json["note"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['complete'] = this.complete;
    data['note'] = this.note;
    return data;
  }
}
