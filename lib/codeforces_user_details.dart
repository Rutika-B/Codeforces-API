import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;
import 'package:rest_api2/codeforces_user_status.dart';
import 'package:rest_api2/models/codeforces_user_DetailsModel.dart';

class userDetails extends StatefulWidget {
  final String handle;
  const userDetails({Key? key, required this.handle}) : super(key: key);

  @override
  State<userDetails> createState() => _userDetailsState();
}

class _userDetailsState extends State<userDetails> {
  Future<UserInfoModel> getuserDetailsApi() async {
    final response = await http.get(Uri.parse(
        'https://codeforces.com/api/user.info?handles=' + '${widget.handle}'));

    var data = jsonDecode(response.body.toString());
    print(data);

    if (response.statusCode == 200) {
      return UserInfoModel.fromJson(data);
    } else {
      return UserInfoModel.fromJson(data);
    }
  }

  void towardsUserStatus() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => userStatus(handle: widget.handle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: FutureBuilder<UserInfoModel>(
        future: getuserDetailsApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.status.toString());
            if (snapshot.data!.status.toString() == "OK") {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 250,
                    margin: EdgeInsets.symmetric(horizontal: 93, vertical: 15),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 37, 50, 121),
                    ),
                    child: Image(
                      image: NetworkImage(
                          '${snapshot.data?.result![0].titlePhoto}'),
                    ),
                  ),
                  Container(
                    height: 300,
                    width: 310,
                    padding: EdgeInsets.all(6),
                    color: Color.fromARGB(255, 204, 238, 118),
                    margin: EdgeInsets.all(7),
                    child: Column(
                      children: [
                        Text(
                          '${snapshot.data?.result![0].rank}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          '${snapshot.data?.result![0].handle}',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          "Rating:" + '${snapshot.data?.result![0].rating}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Friend of:" +
                              '${snapshot.data?.result![0].friendOfCount}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "MaxRank:" + '${snapshot.data?.result![0].maxRank}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "MaxRating:" +
                              '${snapshot.data?.result![0].maxRating}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: TextButton(
                            onPressed: towardsUserStatus,
                            child: Text(
                              'Submission',
                              style: TextStyle(fontSize: 25),
                            ),
                            style: TextButton.styleFrom(
                              // foregroundColor: Colors.,
                              alignment: Alignment.center,
                              backgroundColor:
                                  Color.fromARGB(255, 150, 199, 43),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            return Text('No such user exist');
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
