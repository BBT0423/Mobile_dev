import 'package:flutter/material.dart';
import 'package:flutter_application_7/data_account.dart';
import 'package:flutter_application_7/provider_for_account.dart';
import 'package:provider/provider.dart';

class EditForm extends StatefulWidget {
  @override
  State<EditForm> createState() => _EditForm();
}

class _EditForm extends State<EditForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final accountDetail = ModalRoute.of(context)!.settings.arguments as Account;

    final Name_Controller = TextEditingController(text: accountDetail.Name);
    final password_Controller =
        TextEditingController(text: accountDetail.password);
    final Email_Controller = TextEditingController(text: accountDetail.Email);

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
                  keyboardType: TextInputType.text,
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
                      child: Text('Password'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: password_Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Password',
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
                      alignment: Alignment.topLeft,
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
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'กรุณาระบุ Email';
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
                          provider.editaccount(statement);
                          //print(ISBN + bookName + price);

                          Navigator.pop(context);
                        }
                      },
                      child: Text('Submit'),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                //-----------------End Cancle & Submit -----------------
                const SizedBox(height: 20),
                GestureDetector(
                  child: Container(
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    var provider =
                        Provider.of<provider_account>(context, listen: false);
                    provider.deleteaccount(accountDetail);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
