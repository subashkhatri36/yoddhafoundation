import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.login),
        centerTitle: true,
      ),
     body: Center(
       child: SizedBox(
         height: 350,
         child: Form(
           child: Column(
             children: <Widget>[
              //  SizedBox(height: 10.0,),
              Text("सहिद तथा बेपत्ता योद्धा सन्तती फाउन्डेशन", 
               style:Theme.of(context).textTheme.bodyText2),
               const SizedBox(height: 10.0,),
               const Text("Start to Sign In", style: TextStyle(
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold
               ),),
               const SizedBox(height: 10.0,),
         
               Padding(
                 padding: const EdgeInsets.all(18.0),
                 child: Column(
                   children: <Widget>[
                       TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Enter Email",
                          // border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20.0))
                        ),
                      ),
         
                    const SizedBox(height: 10.0,),
                    TextFormField(
                      decoration:  InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Enter Password",
                        suffixIcon: IconButton(
                        onPressed: (){}, 
                        icon: const Icon(Icons.visibility_off))
                      ),
                    ),
         
                     const SizedBox(height: 15.0,),
                     SizedBox(
                       height: 40,
                       width: double.infinity,
                       child: ElevatedButton(
                        onPressed: (){
                        }, 
                        child: const Text("Login"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            const TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                        ),
                     ),
                     const SizedBox(height: 5.0,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                        Row(
                           children: [
                           Obx(() => Checkbox(
                               value: controller.rememberMe.value, 
                               onChanged: (value){
                                controller.rememberMe.value=value!;
                               },
                               )),
                              const  Text("Remember Me"),
                           ],
                         ),
         
                         Padding(
                           padding: const EdgeInsets.only(left: 15.0),
                           child: GestureDetector(
                             onTap: (){},
                           child: const Text("Forgot Password"),
                           ),
                         ),
                       ],
                     )
                   ],
                 ),
               ),
             ],
           ),
         ),
       ),
     ),
    
    );
  }
}
