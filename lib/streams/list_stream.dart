import 'package:andrewshay/models/task_model.dart';
import 'package:andrewshay/popups/add_task.dart';
import 'package:andrewshay/row_widgets/task_card.dart';
import 'package:flutter/material.dart';

class ListStream extends StatefulWidget {
  final filter;
  ListStream({ this.filter});
  @override
  _ListStreamState createState() => _ListStreamState();
}

class _ListStreamState extends State<ListStream> {
  final scrollController = ScrollController();
  TaskList tasks;
  int page = 0;
  bool scrolling = false;

  initState(){
    tasks = TaskList(filter: widget.filter);
    print(tasks);
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.offset){
        if(page==0){
          page=1;
        }
        tasks.loadMore(page+=1);

      }
      if(scrollController.offset >= 500){
        scrolling = true;
      } else {
        scrolling = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black12,

        ),
        StreamBuilder(
            stream: tasks.stream,
            builder:(BuildContext _context, AsyncSnapshot _snapshot){
              if (_snapshot.hasData) {
                print(_snapshot);
                return Stack(
                    children: [
                      Container(
                          padding: EdgeInsets.only(bottom: 40),
                          margin: EdgeInsets.only(left: 10.0, bottom: 30.0),
                          child: RefreshIndicator(
                            onRefresh: tasks.refresh,
                            child: ListView.builder(
                              controller: scrollController,
                              scrollDirection: Axis.vertical,
                              itemCount: _snapshot.data == null ? 0 : _snapshot.data
                                  .length + 1,
                              itemBuilder: (context, index) {
                                if (index < _snapshot.data.length) {
                                  return TaskCard(
                                    task: _snapshot.data[index],
                                  );
                                } else if (tasks.hasMore) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 32.0),
                                    child: Center(child: CircularProgressIndicator()),
                                  );
                                } else {
                                  return Padding(
                                      padding: EdgeInsets.symmetric(vertical: 32.0),
                                      child: Center(
                                        child: Text("End of Tasks. Total tasks: "+_snapshot.data.length.toString()),
                                      )
                                  );
                                }
                              },
                            ),
                          )
                      ),
                      Positioned(
                        bottom: 130.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: FloatingActionButton(
                                  child: Icon(Icons.add),
                                  backgroundColor: Colors.green,
                                  onPressed: ()async{
                                    print("here");
                                    await Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => AddTask()));
                                  }
                              )
                          ),
                        ),
                      ),


                    ]
                );
              } else {
                return Container(
                    child: Center(
                        child: Container(
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.width,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                Center(child: CircularProgressIndicator()),
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom:100.0),
                                      child: Text("Checking for new tasks"),
                                    )),
                              ],
                            )
                        )
                    )
                );

              }
            })


      ],
    );
  }
}