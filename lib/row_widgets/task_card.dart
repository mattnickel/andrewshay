import 'package:andrewshay/api_services/tasks_api.dart';
import 'package:andrewshay/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  TaskCard({ this.task});

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _isChecked= false;

  @override
  Widget build(BuildContext context) {
    return

    Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left:20.0, right:20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: Container(
              // margin: EdgeInsets.only(top: 20, left:20.0, right:20),
              color: Colors.white,
              height: 140,
              width:MediaQuery.of(context).size.width - 40,
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.greenAccent),
              //   borderRadius: BorderRadius.circular(20),
              // ),
              // color: Colors.black12,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0, right: 20, bottom: 5, top:10),
                    child: Container(
                      padding: EdgeInsets.only(left:10),
                      // width:200,
                      child: Column(

                        children: [

                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Unassigned", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12), textAlign: TextAlign.left,)),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top:3.0),
                                child: Text(widget.task.title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                              )),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:5.0),
                              child: Text(widget.task.description),
                            ),
                          )
                        ],
                      ),
                    ),

                  ),
                  Positioned(
                      right: -15,
                      bottom: 0,
                      child: FlatButton(
                        padding: EdgeInsets.only(right:0.0),
                        child: Text("Edit", style:TextStyle(color: Colors.green, fontWeight: FontWeight.w600)),
                        onPressed: (){},
                      )
                  ),
                  Positioned(
                      right: 0,
                      top:0,
                      child:CircularCheckBox(
                        value: _isChecked,
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        inactiveColor: Colors.black,
                        disabledColor: Colors.grey ,
                        onChanged: (val) => this.setState(() {
                          _isChecked= !_isChecked;
                          changeStatus(_isChecked);
                        }) ),
                      // title: Text("Click me"),
                      // onTap: ()=> this.setState(() { this.selected= !this.selected ;}),


                      ),
                  Positioned(
                      left:0,
                      top:0,
                      child:Container(
                          height:70,
                          width:70,
                          color:Colors.black,
                          child: Center(
                            child:
                            widget.task.dueDate != null
                                ? Column(
                                  children: [
                                    Padding(padding: EdgeInsets.only(top:10)),
                                    Text(
                                      widget.task.dueMonth,
                                      style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 12,


                                      ),
                                    ),
                                    Text(
                                      widget.task.dueDay,
                                      style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w800,
                                          height:1
                                      ),
                                    ),
                                    Text(
                                      widget.task.dueWeekday,
                                      style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 10,
                                          height:1),
                                    ),
                                  ],
                                )
                                : Icon(Icons.calendar_today_sharp, color: Colors.white),
                          )
                      )
                  ),
                  Positioned(
                      left:0,
                      bottom:0,
                      child:Container(
                          height:70,
                          width:70,
                          color:Colors.green,
                          child: Center(
                              child: Icon(Icons.add_alert_rounded, color: Colors.white)
                          )
                      )
                  )
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
