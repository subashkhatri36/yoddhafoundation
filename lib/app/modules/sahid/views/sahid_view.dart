import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';
import 'package:yoddhafoundation/app/widgets/input/custom_container.dart';
import 'package:yoddhafoundation/app/widgets/input/custome_input.dart';
import '../controllers/sahid_controller.dart';
import 'package:image_picker/image_picker.dart';

class SahidView extends GetView<SahidController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("सहिद विवरण", style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
        child: Column(
          children: <Widget>[
          //Profile Upload
           Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: CircleAvatar(
                radius: 71,
                backgroundColor: Colors.green,
               child: CircleAvatar(
                 radius: 65,
                backgroundColor: Colors.green,
                // backgroundImage: AssetImage('assets/images/download.jpg'),
                // ignore: unnecessary_null_comparison
                backgroundImage: controller.pickedImg == null
                ? null :FileImage(controller.pickedImg!),
               ),
              ),
            ),
            Positioned(
              top: 120,
              left: 100,
            child: RawMaterialButton(
              elevation: 10,
              fillColor: Colors.purpleAccent,
              child: const Icon(Icons.add_a_photo),
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
            onPressed: (){
              showDialog(
              context: context, 
              builder: (BuildContext context){
                return AlertDialog(
                  title: const Text("Choose Option", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.purple
                  ),),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: [
                        InkWell(
                          onTap: controller.pickImageCamera,
                         splashColor: Colors.deepPurple,
                         child: Row(
                           children: const [
                             Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.camera,
                                color: Colors.purpleAccent,
                              ),
                              ),
                              Text("Camera", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),),
                           ],
                         ),
                        ),
                  
                        InkWell(
                          onTap: controller.pickImageGallery,
                          splashColor: Colors.purpleAccent,
                          child: Row(
                            children:const [
                              Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.image,
                                color: Colors.deepPurple,
                              ),
                              ),
                              Text("Gallery", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              ),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
            }
            ),
            ),
          ],
        ),
      
           const CustomeInput(
              hintText: Strings.sahidName,
              prefix: Icons.person,
            ),
           const CustomContainer(),
           const CustomeInput(
              hintText: Strings.deathDate,
              prefix: Icons.calendar_today,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(Strings.sahidAddress,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16.0,),),
              ),
            ),
            const CustomeInput(
              hintText: Strings.state,
              prefix: Icons.place,
            ),
            const CustomeInput(
              hintText: Strings.district,
              prefix: Icons.place,
            ),
            const CustomeInput(
              hintText: Strings.localArea,
              prefix: Icons.place,
            ),
            const CustomeInput(
              hintText: Strings.oda,
              prefix: Icons.place,
            ),
            const CustomeInput(
              hintText: Strings.tol,
              prefix: Icons.place,
            ),
            const CustomeInput(
              hintText: Strings.deathPlace,
              prefix: Icons.home,
            ),

          //  CustomButton(
          //   onpressed: (){}, 
          //   btnText:  'Save And Next'),     
          ],
        ),
        ),
      ),
    );
  }
}
