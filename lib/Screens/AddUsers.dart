import 'package:apniapi/webServices/webControler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/UserAddRequestModel.dart';
import '../Model/UserAddResponseModel.dart';

class Adduser extends StatefulWidget {
  const Adduser({Key? key}) : super(key: key);

  @override
  State<Adduser> createState() => _AdduserState();
}

class _AdduserState extends State<Adduser> {
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();
  String status = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [

            Text(status),
             SizedBox(height: 20,),
             TextField(
              controller: name,
              decoration: InputDecoration(
                  label: Text('Name'),
                border: OutlineInputBorder()
              ),
            ),

            SizedBox(height: 20,),
             TextField(
              controller: job,
              decoration: InputDecoration(
                label: Text('job'),
                  border: OutlineInputBorder()
              ),
            ),
    SizedBox(height: 20,),

            ElevatedButton(onPressed: () {
              addUser();

            }, child: Text("submit"))

          ],

        ),
      ),
    );
  }

  addUser()async{

    UserAddRequestModel requestdata = UserAddRequestModel(name: name.text.toString(), job: job.text.toString());

    UserAddResponseModel? data =await  WebControler().adduser(context, requestdata);

    if(data!=null){
      setState(() {
        status = "user created with id ${data.id}  ${data.name}  ${data.job}";
      });

    }else{
      setState(() {
        status ="something went wrong";
      });
    }
  }
}
