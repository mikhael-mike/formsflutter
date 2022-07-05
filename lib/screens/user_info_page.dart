
import 'package:flutter/material.dart';

import '../model/user.dart';


class UserInfoPage extends StatelessWidget {

  User userInfo;
  UserInfoPage({required this.userInfo});
  // const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User info'),
      ),
     body: Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        
        children: <Widget>[
          ListTile(
            title: Text('${userInfo.name}', style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('Story'),
            leading: Icon(Icons.person, color: Colors.green,),
            trailing: Text('${userInfo.country}'),
          ),
          ListTile(
            title: Text('${userInfo.phone}', style: TextStyle(fontWeight: FontWeight.w500),),
            leading: Icon(Icons.phone, color: Colors.green,),
          ),
          ListTile(
            title: Text('${userInfo.email}', style: TextStyle(fontWeight: FontWeight.w500),),
            leading: Icon(Icons.email, color: Colors.green,),
          ),
        ],
      ),
     ),
    
    );
  }
}