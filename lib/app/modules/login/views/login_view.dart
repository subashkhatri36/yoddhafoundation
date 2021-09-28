import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/modules/dashboard/views/dashboard_view.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';
import 'package:yoddhafoundation/app/widgets/input/custome_input.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child: Form(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                const SizedBox(height: 20.0,),
                 Text(Strings.loginheding, 
                 style:Theme.of(context).textTheme.bodyText1!.copyWith(fontSize:22.0, ),
                 
                 textAlign: TextAlign.center,
                 ),
                 const SizedBox(height: 10.0,),
                 const Text("Start to Sign In", style: TextStyle(
                   fontSize: 20.0,
                   fontWeight: FontWeight.bold
                 ),),
                 const SizedBox(height: 10.0,),
         
                 Column(
                   children: <Widget>[
                   const SizedBox(height: 10.0,),
                 const  CustomeInput(hintText: 'Enter Email',
                 prefix: Icons.email,),
       
                  const SizedBox(height: 10.0,),
                  
                 const  CustomeInput(
                  hintText: 'Enter Password',
                  obstext: true,
                  prefix: Icons.lock,
                  suffix: Icons.visibility_off,
                  showsuffix: true,
                  ),        
                    const SizedBox(height: 15.0,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                      onTap: (){},
                      child: const Text("Forget Password", 
                                     
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      ),),
                    ),
                     const SizedBox(height: Constants.defaultMargin,),
                     CustomButton(
                       onpressed: (){
                         Get.to(DashboardView());
                       },
                       btnText: 'Login',
                     ),
                     const SizedBox(height: 5.0,),
                   ],
                 ),
               ],
             ),
           ),
         ),
       ),
     ),
    
    );
  }
}
