import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'data.dart';

class transactionDB {
  String dbName;
  transactionDB({required this.dbName});

  Future openDatabase() async {
    var appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);

    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);

    return db;
  }

  Future insertData(BookModel statement) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store('bookstore'); //สร้างที่เก็บข้อมูล

    var keyID = store.add(db, {
      'ISBN' : statement.ISBN,
      'bookName' : statement.bookName,
      'price' : statement.price,
    });
    db.close();
    return keyID;
  }

  Future EditData(BookModel statement) async{
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store('bookstore');
    
    final fiderData = Finder(filter: Filter.equals('ISBN', statement.ISBN));
    await store.update(db, {
      'bookName' : statement.bookName,
      'price' : statement.price
    },
    finder: fiderData);
    db.close();
  }

  Future DeleteData(BookModel statement) async{
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store('bookstore');

    final fiderData = Finder(filter: Filter.equals('ISBN', statement.ISBN));
    await store.delete(db, finder: fiderData);
    print(fiderData);
    db.close();
  }

  Future selectData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store('bookstore');

    var snapshot = await store.find(db);
    print(snapshot);
    var bookList = <BookModel>[];
    for(var record in snapshot){
      bookList.add(BookModel(ISBN: record.value['ISBN'].toString(), bookName: record.value['bookName'].toString(), price: double.parse(record.value['price'].toString())));
    }
    db.close();
    return bookList;
  }
}
