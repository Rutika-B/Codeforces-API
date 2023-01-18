import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rest_api2/models/codeforces_userStatus_model.dart';
import 'package:http/http.dart' as http;

class userStatus extends StatefulWidget {
  final String handle;
  const userStatus({Key? key, required this.handle}) : super(key: key);

  @override
  State<userStatus> createState() => _userStatusState();
}

class _userStatusState extends State<userStatus> {
  Future<UserStatusModel> getuserStatusApi() async {
    final response = await http.get(Uri.parse(
        'https://codeforces.com/api/user.status?handle=' +
            '${widget.handle}' +
            '&from=1&count=1000'));

    var data = jsonDecode(response.body.toString());
    print(data);

    if (response.statusCode == 200) {
      return UserStatusModel.fromJson(data);
    } else {
      return UserStatusModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: FutureBuilder<UserStatusModel>(
        future: getuserStatusApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.status.toString());
            if (snapshot.data!.status.toString() == "OK") {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: FittedBox(
                  child: DataTable(
                    headingRowHeight: 150,
                    dividerThickness: 4,
                    dataRowHeight: 120,
                    dataRowColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected))
                        return Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.08);
                      return null; // Use the default value.
                    }),
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Index',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Rating',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      snapshot.data?.result?.length.toInt() ?? 0,
                      (ind) => DataRow(
                        cells: [
                          DataCell(
                            Text(
                              '${snapshot.data?.result![ind].problem!.index}',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.normal),
                            ),
                          ),
                          DataCell(
                            Text(
                              '${snapshot.data?.result![ind].problem!.name}',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.normal),
                            ),
                          ),
                          DataCell(
                            Text(
                              '${snapshot.data?.result![ind].problem!.rating}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
