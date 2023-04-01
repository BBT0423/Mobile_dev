import 'package:flutter/material.dart';
import 'package:flutter_application_7/data_account.dart';
import 'package:flutter_application_7/provider.dart';
import 'package:flutter_application_7/provider_for_account.dart';
import 'package:provider/provider.dart';
import 'data.dart';

class Addaccount extends StatefulWidget {
  @override
  State<Addaccount> createState() => _Addaccount();
}

class _Addaccount extends State<Addaccount> {
  final formKey = GlobalKey<FormState>();

  final Name_Controller = TextEditingController();
  final password_Controller = TextEditingController();
  final Email_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ฟอร์มบันทึกข้อมูล'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(height: 50),
                //ส่วนรับข้อมูล ISBN
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.auto_stories),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text('Name'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: Name_Controller,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'กรุณากรอกชื่อ';
                    }
                  },
                ),
                //-----------------End ISBN -----------------
                const SizedBox(height: 20),
                //ส่วนรับข้อมูล bookName
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.library_books),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text('password'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: password_Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'กรุณาระบุ Password';
                    }
                  },
                ),
                const SizedBox(height: 20),
                //-----------------End bookName -----------------

                Row(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.auto_stories),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text('E-mail'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: Email_Controller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'กรุณาระบุ E-mail';
                    }
                  },
                ),

                //-----------------End bookprice -----------------

                const SizedBox(height: 20),
                //ปุ่ม Cancle และ Submit
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancle'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          var Name = Name_Controller.text;
                          var password = password_Controller.text;
                          var Email = Email_Controller.text;

                          var statement = Account(
                              Name: Name, password: password, Email: Email);
                          var provider = Provider.of<provider_account>(context,
                              listen: false);
                          provider.addaccount(statement);
                          // print(Name + password + Email);

                          Navigator.pop(context);
                        }
                      },
                      child: Text('Submit'),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                //-----------------End Cancle & Submit -----------------
              ],
            ),
          ),
        ),
      ),
    );
  }
}
