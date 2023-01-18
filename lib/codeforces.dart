import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api2/models/codeforces_model.dart';
import 'package:rest_api2/models/makeup_model.dart';
import 'package:rest_api2/models/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

class codeforces extends StatefulWidget {
  final int id;
  const codeforces({Key? key, required this.id}) : super(key: key);

  @override
  State<codeforces> createState() => _example3State();
}

class _example3State extends State<codeforces> {
  Future<CodeforcesModel> getcodeforcesApi() async {
    final response = await http.get(Uri.parse(
        'https://codeforces.com/api/contest.hacks?contestId=' +
            '${widget.id}'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return CodeforcesModel.fromJson(data);
    } else {
      return CodeforcesModel.fromJson(data);
    }
  }

  _launchURLBrowser() async {
    var url = Uri.parse("https://www.geeksforgeeks.org/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("API"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<CodeforcesModel>(
              future: getcodeforcesApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.result?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            tileColor: Colors.amber,
                            title: Text(
                                "${snapshot.data?.result![index].problem!.index}" +
                                    ". ${snapshot.data?.result![index].problem!.name}"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                            height: MediaQuery.of(context).size.height * 0.2,
                            color: Colors.cyan,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Text("Points: " +
                                    "${snapshot.data?.result![index].problem!.points}"),
                                Text("Rating:  " +
                                    "${snapshot.data!.result![index].problem!.rating}"),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: snapshot.data?.result?[index]
                                        .problem!.tags!.length,
                                    itemBuilder: (context, tagind) {
                                      return TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.amber,
                                          backgroundColor: Colors.blue[900],
                                          shape: StadiumBorder(),
                                        ),
                                        onPressed: _launchURLBrowser,
                                        child: Text(
                                            "${snapshot.data?.result![index].problem!.tags![tagind]}"),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
