import 'package:flutter/material.dart';
import 'package:flutter_application_7/add_account.dart';
import 'package:flutter_application_7/data_account.dart';
import 'package:flutter_application_7/trans_account.dart';
import 'package:sembast/sembast.dart';

class provider_account extends ChangeNotifier {
  List<Account> accountDetail = [
    Account(
        Name: 'Boat', password: 'BBT042322', Email: 'pongpan22120@gmail.com'),
    // BookModel(ISBN: '9503895032134', bookName: 'Mobile Dev.', price: 250),
    // BookModel(ISBN: '6578543298797', bookName: 'Flutter', price: 350),
    // BookModel(ISBN: '6330200483', bookName: 'ไก่อ่อน', price: 50),
  ];

  List<Account> getData() {
    return accountDetail;
  }

  addaccount(Account accountData) async {
    var ac = await transactionaccount(acName: 'transections_account.db');
    //print(db);

    await ac.insertData(accountData);

    accountDetail = await ac.selectData();

    //bookDetail.insert(0, bookData);
    //bookDetail.add(bookData);
    notifyListeners();
  }

  editaccount(Account accountData) async {
    var ac = await transactionaccount(acName: 'transections_account.db');

    await ac.EditData(accountData);
    accountDetail = await ac.selectData();
    notifyListeners();
  }

  deleteaccount(Account accountData) async {
    var ac = await transactionaccount(acName: 'transections_account.db');

    await ac.DeleteData(accountData);
    accountDetail = await ac.selectData();
    notifyListeners();
  }

  initalaccount() async {
    var ac = await transactionaccount(acName: 'transections_account.db');
    accountDetail = await ac.selectData();
    notifyListeners();
  }
}
