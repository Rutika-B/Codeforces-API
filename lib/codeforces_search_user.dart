import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rest_api2/codeforces_user_details.dart';
import 'package:rest_api2/codeforces_user_status.dart';

import 'models/codeforces_userStatus_model.dart';

class searchUser extends StatefulWidget {
  const searchUser({super.key});

  @override
  State<searchUser> createState() => _searchUserState();
}

class _searchUserState extends State<searchUser> {
  final TextEditingController _handlNamecontroller = TextEditingController();

  void handleProvider() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => userDetails(handle: _handlNamecontroller.text)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _handlNamecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: 400,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Image(
                image: NetworkImage(
                    'https://assets.codeforces.com/users/kguseva/comments/cf.png'),
              ),
            ),
            TextField(
              controller: _handlNamecontroller,
              decoration: const InputDecoration(
                hintText: 'Enter handle',
                filled: true,
                contentPadding: EdgeInsets.all(8.0),
              ),
              keyboardType: TextInputType.text,
              obscureText: false,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: handleProvider,
                child: Container(
                  child: Text(
                    "Search",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  width: 150,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(13),
                  decoration: const ShapeDecoration(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(47),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
