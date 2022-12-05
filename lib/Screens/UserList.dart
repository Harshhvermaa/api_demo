import 'package:apniapi/webServices/webControler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/UserModel.dart';
import 'AddUsers.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<Datum> userlist = [];
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Adduser(),));

        }, icon: Icon(Icons.add,color: Colors.white,))],
      ),
      body: status?ListView.separated(itemBuilder: (context, index) => Text("${userlist[index].id} ${userlist[index].firstName}"),
          separatorBuilder: (context, index) => SizedBox(height: 10,),
          itemCount: userlist.length):Center(child: CircularProgressIndicator(),),
    );
  }

  getuser() async{
    UserModel? data = await WebControler().getuser(context);
    if(data!=null){

      setState(() {
        status = true;
        userlist = data.data;
      });

    }else{
      setState(() {
        status = false;
      });
    }
  }
}
