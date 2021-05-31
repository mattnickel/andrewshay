import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';


class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  void initState(){
    super.initState();
  }


  bool isLoading = false;
  final taskController = TextEditingController();
  final titleController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  DateTime todayDate = DateTime.now();
  DateTime selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
      });
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              color: Colors.white,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height:  MediaQuery
                  .of(context)
                  .size
                  .height,
              child: SingleChildScrollView(

                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top:40, left: 20, right:10),
                        child: Row(
                          children: [
                            Text(
                              "Create Task",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black87,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 50,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(icon: Icon(Icons.cancel,
                                    color: Colors.black54),
                                  onPressed: () {
                                    setState(() {

                                    });
                                    Navigator.pop(context, 'close');
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),

                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal:25.0),
                      child: TextField(
                        controller: titleController,
                        maxLength: 40,
                        decoration: InputDecoration(
                          focusedBorder:OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                          hintText: 'Title of Task... ',
                          fillColor: Colors.grey,
                            labelStyle: TextStyle(color: Colors.black)

                        ),
                        keyboardType: TextInputType.multiline,
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: TextField(
                        controller: taskController,
                        maxLength: 250,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder:OutlineInputBorder(),
                            border: OutlineInputBorder(),
                            hintText: 'Task to be done... ',
                            fillColor: Colors.grey,
                            labelText: 'Description',
                            labelStyle: TextStyle(color: Colors.black)
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        onChanged: (tex) {
                          setState(() {
                            _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut
                            );
                          });
                        },
                      ),
                    ),
                    Container(
                      margin:const EdgeInsets.symmetric(horizontal:25.0) ,
                      // padding: const EdgeInsets.only(left:10.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(3.0),
                        ),
                        ),
                      child: FlatButton(
                        onPressed: () => _selectDate(context),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("Due Date:  ", style: TextStyle(fontSize: 15),),
                            selectedDate!= null
                                ? Text("${selectedDate.toLocal()}".split(' ')[0], style: TextStyle(fontSize: 15))
                                : Container(),
                            Spacer(),
                            Icon(Icons.date_range_sharp),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width/2,
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      margin: EdgeInsets.only(top: 5.0),
                      child: RaisedButton(
                        onPressed: taskController.text == '' ? null :
                            ()async {
                          setState((){isLoading = true;});

                          // await savePost(
                          //     messageController.text, image);
                          // Navigator.pop(context, 'yep');
                        },
                        elevation: 0.2,
                        color: Colors.green,
                        disabledColor:  Colors.green,
                        child: isLoading
                            ? Center(child:CircularProgressIndicator())

                            :Text("Save task", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
      }
}


