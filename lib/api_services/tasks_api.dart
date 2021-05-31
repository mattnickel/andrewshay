import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

import 'package:andrewshay/models/task_model.dart';

String localUrl = 'http://localhost:3000/api/v1';

Future <List<Map>> getTasks(client, page, {filter}) async {
  var updateResponse;
  var dir = await getTemporaryDirectory();
  File file = File(dir.path + "/tasks.json");
  // final storage = FlutterSecureStorage();
  var url;
  // String token = await storage.read(key: "token");
  // final tokenHeaders = {'token': token, 'content-type': 'application/json'};
  final tokenHeaders = {'content-type': 'application/json'};
  if (filter != null){
    print('filter that url: $filter');
    url = "$localUrl/tasks/filter?filter=$filter";
  } else {
    url = "$localUrl/tasks";
  }

  final response = await client.get(
    url, headers: tokenHeaders,
  );
  print("Response: "+response.body);
  if (response != null) {
    if (response.statusCode == 200) {
      print("tasks from api");
      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
      return parseTasks(response.body);
    } else {
      print("not updated from api");
      // print(response.body);
      return null;
    }
  } else return null;
}
List<Map> parseTasks(String responseBody) {
  final responseJson = utf8.decode(responseBody.runes.toList());
  print (responseJson);
  final parsed = json.decode(responseJson).cast<Map<String, dynamic>>();
  return parsed;
}

changeStatus(b){

}