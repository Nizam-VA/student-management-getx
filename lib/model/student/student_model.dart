class Student {
  int id;
  String name;
  String place;
  String age;
  String mobile;
  String image;

  Student({
    required this.id,
    required this.name,
    required this.place,
    required this.age,
    required this.mobile,
    required this.image,
  });

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      name: map['name'] as String,
      place: map['place'] as String,
      age: map['age'] as String,
      mobile: map['mobile'] as String,
      image: map['image'] as String,
    );
  }
}
