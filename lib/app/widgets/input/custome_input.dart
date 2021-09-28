import 'package:flutter/material.dart';

class CustomeInput extends StatefulWidget {
  const CustomeInput({ Key? key,this.obstext=false, this.showsuffix=false, this.color =Colors.white, this.hintText='', this.labeltext='', this.controller, this.prefix, this.suffix}) : super(key: key);
  final Color color;
  final String hintText;
  final bool obstext;
  final String labeltext;
  final TextEditingController? controller;
  final IconData? prefix;
  final IconData? suffix;
  final bool showsuffix;

  @override
  State<CustomeInput> createState() => _CustomeInputState();
}

class _CustomeInputState extends State<CustomeInput> {
  bool showpassword=true;

  void show(value){
    setState(() {
      showpassword=value;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.color),

      child: TextFormField(
        controller: widget.controller,
        obscureText:widget.obstext==true? showpassword:widget.obstext,
        decoration: InputDecoration(
          hintText: widget.hintText,label: widget.labeltext!=''?Text(widget.labeltext):null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            gapPadding: 0.0,
            
          ),
          prefixIcon: Icon(widget.prefix),
          suffix:widget.showsuffix? GestureDetector(
            onTap: (){
              showpassword=!showpassword;
              show(showpassword);
            },
            child:showpassword? Icon(widget.suffix):Icon(Icons.visibility)):null,
        ),        
      ),  
    );
  }
}