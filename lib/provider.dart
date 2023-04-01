import 'package:flutter/material.dart';
import 'data.dart';
import 'trans.dart';
import 'package:sembast/sembast.dart';

class test_provider extends ChangeNotifier{

  List<BookModel> bookDetail = [
    // BookModel(ISBN: '9503895032134', bookName: 'Mobile Dev.', price: 250),
    // BookModel(ISBN: '6578543298797', bookName: 'Flutter', price: 350),
    // BookModel(ISBN: '6330200483', bookName: 'ไก่อ่อน', price: 50),
  ];

  List<BookModel> getData(){
    return bookDetail;
  }

  addBook(BookModel bookData) async {
    var db = await transactionDB(dbName: 'transections.db');
    //print(db);

    await db.insertData(bookData);

    bookDetail = await db.selectData();

    //bookDetail.insert(0, bookData);
    //bookDetail.add(bookData);
    notifyListeners();
  }

  editBook(BookModel bookData) async{
    var db = await transactionDB(dbName: 'transections.db');

    await db.EditData(bookData);
    bookDetail = await db.selectData();
    notifyListeners();
  }

  deleteBook(BookModel bookData) async{
    var db = await transactionDB(dbName: 'transections.db');

    await db.DeleteData(bookData);
    bookDetail = await db.selectData();
    notifyListeners();
  }
  
  initalBook() async {
    var db = await transactionDB(dbName: 'transections.db');
    bookDetail = await db.selectData();
    notifyListeners();
  }
}
