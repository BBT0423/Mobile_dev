import 'package:flutter_application_7/data_account.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

class transactionaccount {
  String acName;
  transactionaccount({required this.acName});

  Future openDatabase() async {
    var appDirectory = await getApplicationDocumentsDirectory();
    String acLocation = join(appDirectory.path, acName);

    DatabaseFactory acFactory = await databaseFactoryIo;
    Database ac = await acFactory.openDatabase(acLocation);

    return ac;
  }

  Future insertData(Account statement) async {
    var ac = await this.openDatabase();
    var store = intMapStoreFactory.store('accountstore'); //สร้างที่เก็บข้อมูล

    var keyID = store.add(ac, {
      'Name': statement.Name,
      'password': statement.password,
      'Email': statement.Email,
    });
    ac.close();
    return keyID;
  }

  Future EditData(Account statement) async {
    var ac = await this.openDatabase();
    var store = intMapStoreFactory.store('accuntstore');

    final fiderData = Finder(filter: Filter.equals('Name', statement.Name));
    await store.update(
        ac, {'Name': statement.Name, 'password': statement.password},
        finder: fiderData);
    ac.close();
  }

  Future DeleteData(Account statement) async {
    var ac = await this.openDatabase();
    var store = intMapStoreFactory.store('accountstore');

    final fiderData = Finder(filter: Filter.equals('Name', statement.Name));
    await store.delete(ac, finder: fiderData);
    print(fiderData);
    ac.close();
  }

  Future selectData() async {
    var ac = await this.openDatabase();
    var store = intMapStoreFactory.store('accountstore');

    var snapshot = await store.find(ac);
    print(snapshot);
    var accountList = <Account>[];
    for (var record in snapshot) {
      accountList.add(Account(
        Name: record.value['Name'].toString(),
        password: record.value['password'].toString(),
        Email: record.value['Email'].toString(),
      ));
    }
    ac.close();
    return accountList;
  }
}
