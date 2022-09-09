import 'package:flutter/material.dart';
import 'package:project/email.dart';
class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
 var   h = MediaQuery.of(context).size.height;
    return Directionality(textDirection:TextDirection.rtl ,
        child:Scaffold(
      body: Container(
        child: Center(
          
          child: Padding(padding:EdgeInsets.all(h/39.05) ,
            child: Column(
              children: [
                SizedBox(height: h/50.05),
                Container(
                  height: (h/5.2),
                  width: h/5.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(image:AssetImage("assets/images/logo.jpg"),fit: BoxFit.cover)
                  ),),
                SizedBox(height: h/3.905,),
                Text("اخي المواطن اختي المواطنة"),
              Text("يسرنا نحن بلدية مؤاب الجديدة و انطلاق منا والتزامنا بحل المشاكل التي تواجهكم في مناطق البلدية قمنا بإنشاء تطبيق الإلكتروني لتلقي الشكاوي و العمل على حلها ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                SizedBox(height: h/39.05),
                ElevatedButton(onPressed: () { Navigator.pushReplacement( context, MaterialPageRoute(builder: (context)
                {
                  print(MediaQuery.of(context).size.height);
                  return email();
                },)); },
              child: Text("تقديم الشكوى"),),
              ],
            ),
          ),
        ),
      ),)
    );
  }
}
