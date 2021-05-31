import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../api_services/tasks_api.dart';

class Task {
  int id;
  String title;
  String description;
  String dueDate;
  String dueDay;
  String dueMonth;
  String dueWeekday;
  String status;

  Task({
    this.id,
    this.title,
    this.description,
    this.dueDate,
    this.dueDay,
    this.dueMonth,
    this.dueWeekday,
    this.status
  });

  factory Task.fromServerMap(Map json){
    var date = DateTime.parse(json['due_date']);
    var day = DateFormat('d').format(date);
    var month = DateFormat('MMM').format(date);
    var weekday = DateFormat('EEE').format(date);

    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueDate: json['due_date'],
      dueDay: day.toString().toUpperCase(),
      dueMonth: month.toString().toUpperCase(),
      dueWeekday: weekday.toString().toUpperCase(),
      status: json['status']
    );
  }
}

class TaskList {
  String filter;
  Stream<List<Task>> stream;
  bool hasMore;
  bool _isLoading;
  List<Map> _data;
  StreamController<List<Map>> _controller;

  TaskList({filter}) {
    filter = filter;
    print("filter: $filter");
    _data = List<Map>();
    _controller = StreamController<List<Map>>.broadcast();
    _isLoading = false;
    stream = _controller.stream.map((List<Map> tasksData) {
      print("tasks");
      print(tasksData);
      return tasksData.map((Map taskData) {
        return Task.fromServerMap(taskData);
      }).toList();
    });
    hasMore = true;
    refresh(filter: filter);
  }

  Future<void> refresh({filter}) {
    int page = 1;
    return loadMore(page, clearCachedData: true, filter:filter);
  }

  Future<void> loadMore(page, {filter, bool clearCachedData = false}) {
    print("let's load");
    if (clearCachedData) {
      _data = List<Map>();
      hasMore = true;
      print('clear');
    }
    if (_isLoading || !hasMore) {
      print('nada');
      return Future.value();
    }
    _isLoading = true;
    // print(page);
    var response = getTasks(http.Client(), page, filter: filter);
    print(response);
    return getTasks(http.Client(), page).then((tasksData) {
      _isLoading = false;
      print("we are here");
      _data.addAll(tasksData);
      hasMore = (tasksData.length == 8);
      _controller.add(_data);
    });
  }
}
