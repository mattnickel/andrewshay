import 'package:andrewshay/models/navbar_tab_selected_model.dart';
import 'package:andrewshay/pages/main_list.dart';
import 'package:andrewshay/sidebar_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:notification_permissions/notification_permissions.dart';
// import './services/local_notifications_manager.dart';
// import 'sidebar/sidebar_layout.dart';


class FrameworkPage extends StatefulWidget{

  @override
  _FrameworkPageState createState() => _FrameworkPageState();
}



class _FrameworkPageState extends State<FrameworkPage> {

  @override
  void initState(){
    super.initState();
    // final _firebaseMessaging = FirebaseMessaging();
    // _firebaseMessaging.requestNotificationPermissions();
  }
  // final localNotifications = LocalNotificationsManager.init();

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider<NavbarTabSelectedModel>(
        create: (context) => NavbarTabSelectedModel(),
        child: Consumer<NavbarTabSelectedModel>(
          builder: (context, model, child) =>
            Scaffold(
                  resizeToAvoidBottomInset: false,
                  resizeToAvoidBottomPadding:false,
                  appBar: AppBar(
                    title: Image.asset("assets/images/haylogo.png", width: 250),
                  ),
                  drawer: SideBarMenu(),
                  body: model.currentScreen,
                  extendBody: true,
                  bottomNavigationBar: BottomNavigationBar(
                    selectedItemColor: Colors.green,
                    currentIndex: (model.currentTab),
                    onTap: (int _index){
                      model.currentTab = _index;
                    },// this will be set when a new tab is tapped
                    items: [
                      BottomNavigationBarItem(
                        icon: new Icon(Icons.list_alt),
                        label: 'Main List',
                      ),
                      BottomNavigationBarItem(
                        icon: new Icon(Icons.today_sharp),
                        label: 'For Today',
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: 'For Me'
                      )
                    ],
                  ),

      ),
              )
      );
  }
}
