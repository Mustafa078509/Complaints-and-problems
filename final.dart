import 'package:flutter/material.dart';
import 'package:project/email.dart';



class final1 extends StatefulWidget {
  const final1({Key? key}) : super(key: key);

  @override
  State<final1> createState() => _final1State();
}

class _final1State extends State<final1> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection:TextDirection.rtl ,
        child:Scaffold(
          body: Container(
            child: Center(

              child: Padding(padding:EdgeInsets.all(20) ,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(image:AssetImage("assets/images/logo.jpg"),fit: BoxFit.cover)
                      ),),
                    SizedBox(height: 200,),

                    Text("بلدية مؤاب الجديدة تتمنى لكم يوماً سعيداً",style: TextStyle(fontSize: 16)),
                    SizedBox(height: 20),
                    ElevatedButton(

                      onPressed: () { Navigator.pushReplacement( context, MaterialPageRoute(builder: (context)
                    {
                      return email();
                    },)); },
                      child: Text("تقديم شكوى جديد"),),
                  ],
                ),
              ),
            ),
          ),)
    );}
}
