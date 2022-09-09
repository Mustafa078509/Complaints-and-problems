import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/final.dart';

class email extends StatefulWidget {
  const email({Key? key}) : super(key: key);

  @override
  State<email> createState() => _emailState();
}

class _emailState extends State<email> {



  int val=-1;
  String de="";
  double  h=0;
  TextEditingController PhoneNumber =new TextEditingController();
  TextEditingController From_name =new TextEditingController();
  TextEditingController From_name2 =new TextEditingController();
  TextEditingController Subject =new TextEditingController();
  TextEditingController Content =new TextEditingController();
  TextEditingController location =new TextEditingController();
  TextEditingController Street =new TextEditingController();
   String x ="";

  File? image ;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera
      );
      if(image == null) return;
      final imageTemp = File(image.path);
      this.x= base64Encode( await image.readAsBytes());
      print(image);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {


      this.h = MediaQuery.of(context).size.height ;

    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(



        body: Container(
          height: double.infinity,
          color: Colors.white,
          /*  decoration: BoxDecoration(
            image: DecorationImage(image:AssetImage("assets/images/images.jpg"),fit: BoxFit.cover)
          ),*/
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [


                Container(
                  height: h/5.2,
                  width: h/5.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(image:AssetImage("assets/images/logo.jpg"),fit: BoxFit.cover)
                  ),),
                SizedBox(height: h/39.05,),
                Container(width:double.infinity ,height: 50
                  ,child: Text("نموذج تقديم الشكوى",style: TextStyle(fontSize: 30)),

                ),

                Textname("الاسم الاول","الاسم الاخير",From_name,From_name2),
                Text1("رقم الهاتف",PhoneNumber),

                RadioButton(),
                TextContent("وصف المشكلة",Content),
                uplode(),

                Text1("الموقع",location),
                Text1("الحي الفرعي",Street),


                SizedBox(width: h/78.1,height: 78.1,),
                ElevatedButton(

                  onPressed: () async {

                    sendEmail(From_name.text,From_name2.text,PhoneNumber.text,location.text,Subject.text,Content.text,x);},
                  style:ElevatedButton.styleFrom(fixedSize: Size(MediaQuery.of(context).size.height/3.687272727272728, MediaQuery.of(context).size.height/147.4909090909091),shape: StadiumBorder(),),
                  child: Text("ارسال",style: TextStyle(fontSize: 25)),

                ),






              ],

            ),
          ),



        ),

      ),
    );
  }
  Widget Text1(String title ,TextEditingController Controller ){


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller:Controller,
        style: const TextStyle(
          fontSize: 19 ,
          fontWeight: FontWeight.w500,
          fontFamily: 'Quicksand',
          color: Colors.black,
        ),
        cursorColor: Colors.black,
        cursorWidth: 1,
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(
              color: Colors.black,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 25),
          labelText: title,
          labelStyle: const TextStyle(
              fontSize:19,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w500),
          hintStyle: const TextStyle(
              fontSize: 19,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w500),
          constraints: const BoxConstraints(
            maxHeight: 60,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.5,
                color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          border: const OutlineInputBorder(
            borderSide:
            BorderSide(width: 1.5, color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(9.0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.5, color: Color.fromARGB(255, 0, 0, 0)),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );

  }

  Widget TextContent(String title1 ,TextEditingController Controller ){

    return   Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: TextFormField(
        controller: Controller,
        minLines: 5,
        maxLines: 7,
        keyboardType: TextInputType.multiline,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: 'Quicksand',
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        cursorColor: Colors.black,
        cursorWidth: 1,
        decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 25),
          labelText: "وصف المشكلة",

          alignLabelWithHint: true,
          labelStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w500),
          hintStyle: TextStyle(
              fontSize: 19,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w500),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(9.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.5, color: Color.fromARGB(255, 0, 0, 0)),
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
          ),
        ),
      ),
    );

  }

  Future sendEmail(String name,String name2, String Phone,String location,String subject, String message ,String image) async {
     print(image);

    var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    String serviceId = 'service_7vp4qcu';
    String templateId = 'template_uixgffd';
    String userid1='-BFGfMKWMj7Aif56k';
    var response = await http.post(url,
        headers: {
          'origin':'http//localhost',
          'Content-Type':'application/json'},//This line makes sure it works for all platforms.
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userid1,

          'template_params': {
            'Subject':subject,
            'Phone':Phone,
            'message': message,
            'From_name':name +""+ name2,
            'location':location,
            "Problem":de,
             "image": x,
          }


        }));
    print(response.statusCode);

    if (response.statusCode == 200) {

      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.LEFTSLIDE,
        title: 'تم الارسال',
        body: Column(children: [
          Row(mainAxisAlignment:MainAxisAlignment.center ,children: [

            Text("تم الارسال")
          ],)

        ]),
        btnOkText: "موافق",
        btnOkIcon: Icons.check_circle,

        btnOkColor: Theme.of(context).primaryColor,


        btnOkOnPress: () {
          Navigator.pushReplacement( context, MaterialPageRoute(builder: (context)
          {
            return final1();
          }));
        }
      )..show();

    }


    else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.LEFTSLIDE,
        title: 'الرجاء ادخال جميع الحقول',
        body: Column(children: [
          Row(mainAxisAlignment:MainAxisAlignment.center ,children: [

            Text("الرجاء ادخال جميع الحقول")
          ],)

        ]),
        btnOkText: "موافق",
        btnOkIcon: Icons.check_circle,

        btnOkColor: Theme.of(context).primaryColor,


        btnOkOnPress: () {

        },
      )..show();



    }






  }


  Widget Textname(String title1,String title2 ,TextEditingController Controller ,TextEditingController First){

    var d =MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [Container(

          height: d/9.81,
          width: d/5,

          child:  TextFormField(

            controller:Controller,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              fontFamily: 'Quicksand',
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            cursorColor: Colors.black,
            cursorWidth: 1,
            decoration: InputDecoration(
              floatingLabelStyle: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
              labelText: title1,
              labelStyle: const TextStyle(
                  fontSize: 19,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w500),
              hintStyle: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w500),
              constraints: const BoxConstraints(
                maxHeight: 60,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.5,
                    color:Colors.black ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              border: const OutlineInputBorder(
                borderSide:
                BorderSide(width: 1.5, color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(9.0),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.5, color: Color.fromARGB(255, 0, 0, 0)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),),

          SizedBox(width: d/39.05,height: d/39.05)

          ,Container(

            height: d/9.81,
            width: d/5,

            child:  TextFormField(

              controller:First,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                fontFamily: 'Quicksand',
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              cursorColor: Colors.black,
              cursorWidth: 1,
              decoration: InputDecoration(
                floatingLabelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
                labelText: title2,
                labelStyle: const TextStyle(
                    fontSize: 19,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500),
                hintStyle: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500),
                constraints: const BoxConstraints(
                  maxHeight: 60,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5,
                      color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                border: const OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 1.5, color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(9.0),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5, color: Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),),
        ],
      ),
    );

  }


  Widget floatbutton(){


    return  FloatingActionButton(
        heroTag: "btn2",
        backgroundColor: const Color.fromARGB(255, 145, 26, 26),
        onPressed: () async {

          pickImage();
        },
        child: Icon(
          Icons.image,
          color: Colors.white,
          size:MediaQuery.of(context).size.height / 26,
        )
    );
  }


  Widget uplode(){
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Container(width: double.infinity,height: 150,
        color: Colors.white,

        child: Center(
          child: Column(children: [
            CircleAvatar(child: IconButton(onPressed: (){pickImage();}, icon: Icon(Icons.upload)),radius: 50,)

            , Text("ارفاق صوره")

          ]),
        ) ,

      ),
    );
  }

  Widget RadioButton(){

    return  Column(

      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(" نوع المشكله",style: TextStyle(fontSize: 27)),
        RadioListTile<int>(value: 0, groupValue: val,
          title: Text("مشاكل الصحية") ,
          onChanged: (value){
            setState(() {
              val=0;
              de="مشاكل الصحية";
            });

          },),
        RadioListTile<int>(value: 1, groupValue: val,
          title: Text("مشاكل البنية التحتية",style: TextStyle(fontSize: 20)) ,
          onChanged: (value){
            setState(() {
              val=1;
              de="مشاكل الصحية";
            });

          },),
        RadioListTile<int>(value: 2, groupValue: val,
          title: Text("مشاكل النفايات",style: TextStyle(fontSize: 20)) ,
          onChanged: (value){
            setState(() {
              val=2;
              de="مشاكل النفايات";
            });

          },),
        RadioListTile<int>(value: 3, groupValue: val,
          title: Text("شكاوي أخرى",style: TextStyle(fontSize: 20)) ,
          onChanged: (value){
            setState(() {
              val=3;
              de="شكاوي أخرى";
            });

          },),
      ],
    );

  }



}
