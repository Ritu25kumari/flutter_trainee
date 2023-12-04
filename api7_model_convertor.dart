class MyItem {
  var studentid;
  String? studentname;
  int? rollno;
  int? age;

  MyItem({
    this.studentid,
    this.studentname,
    this.rollno,
    this.age,
  });
  factory MyItem.fromJson(Map<String, dynamic> json) {
    return MyItem(
      studentid: json['studentid'],
      studentname: json['studentname'],
      rollno: json['rollno'],
      age: json['age'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'studentid': studentid,
      'studentname': studentname,
      'rollno': rollno,
      'age': age,
    };
    return data;
  }
}
void main() {
  final myItem = MyItem(
    studentid: 701,
    studentname: 'Ritu',
    rollno: 2004651,
    age: 20
  );
  final myItemJson = myItem.toJson();
  print('MyItem JSON: $myItemJson');

  final parsedMyItem = MyItem.fromJson({
    'studentid': 702,
    'studentname': 'Pihu',
    'rollno': 2004643,
    'age': 21,
  });
  print('Parsed MyItem - studentid: ${parsedMyItem.studentid}, studentname: ${parsedMyItem.studentname}, rollno: ${parsedMyItem.rollno}, age: ${parsedMyItem.age}');
}