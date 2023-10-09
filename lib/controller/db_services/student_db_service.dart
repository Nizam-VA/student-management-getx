import 'package:sqflite/sqflite.dart';
import 'package:student_management_getx/model/student/student_model.dart';

class StudentServices {
  static const table = 'student';
  static const version = 1;

  static const id = 'id';
  static const name = 'name';
  static const place = 'place';
  static const age = 'age';
  static const mobile = 'mobile';
  static const image = 'image';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      'student.db',
      version: version,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        $name TEXT NOT NULL,
        $place TEXT NOT NULL,
        $age TEXT NOT NULL,
        $mobile TEXT NOT NULL,
        $image TEXT NOT NULL
      )
      ''');
  }

  Future<int> insert(Student student) async {
    final db = await database;
    return await db.insert(
      table,
      {
        name: student.name,
        place: student.place,
        age: student.age,
        mobile: student.mobile,
        image: student.image
      },
    );
  }

  Future<List<Student>> getStudents() async {
    final db = await database;
    final List<Map<String, dynamic>> map = await db.query(table);
    return map.isEmpty
        ? []
        : map.map((student) => Student.fromMap(student)).toList();
  }

  Future<int> update(Student student) async {
    final db = await database;
    return await db.update(
        table,
        {
          name: student.name,
          place: student.place,
          age: student.age,
          mobile: student.mobile,
          image: student.image
        },
        where: '$id = ?',
        whereArgs: [student.id]);
  }

  Future<int> delete(int ids) async {
    final db = await database;
    return await db.delete(table, where: '$id =?', whereArgs: [ids]);
  }
}
