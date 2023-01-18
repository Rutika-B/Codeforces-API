import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api2/models/makeup_model.dart';
import 'package:rest_api2/models/user_model.dart';

class example3 extends StatefulWidget {
  const example3({super.key});

  @override
  State<example3> createState() => _example3State();
}

class _example3State extends State<example3> {
  List<MakeupModel> makeupostList = [];

  Future<List<MakeupModel>> getmakeupPostApi() async {
    final response = await http.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        makeupostList.add(MakeupModel.fromJson(i));
      }

      return makeupostList;
    } else {
      return makeupostList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getmakeupPostApi(),
              builder: (context, AsyncSnapshot<List<MakeupModel>> snapshot) {
                return ListView.builder(
                  itemCount: makeupostList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        width: 50,
                        height: 30,
                        child: Image(
                            image: NetworkImage(
                                snapshot.data![index].imageLink.toString())),
                      ),
                      title: Text(snapshot.data![index].category.toString()),
                      subtitle:
                          Text(snapshot.data![index].description.toString()),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
