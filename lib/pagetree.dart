import 'package:flutter/material.dart';
import 'package:flutter_application_7/provider_for_account.dart';
import 'package:provider/provider.dart';

class MyApptree extends StatefulWidget {
  @override
  State<MyApptree> createState() => _MyAppState();
}

class _MyAppState extends State<MyApptree> {
//สร้างข้อมูลรายการหนังสือ
  @override
  void initalaccount() {
    super.initState();
    Provider.of<provider_account>(context, listen: false).initalaccount();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายชื่อบัญชีผู้ใช้'),
      ),
//แสดงรายการหนังสือทั้งหมดในหน้าแอพพลิเคชัน
      body: Consumer(builder: (context, provider_account provider, child) {
        if (provider.accountDetail.length <= 0) {
          return Center(
            child: Text(
              'ไม่มีบัญชีผู้ใช้',
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: provider.accountDetail.length,
            itemBuilder: (context, index) {
              var accountList = provider.accountDetail[index];
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(accountList.Name),
                    Text(accountList.password),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
