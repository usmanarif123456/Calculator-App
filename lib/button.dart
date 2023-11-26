import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key,required this.onpress,required this.title,required this.color});
final String title;
final Color color;
final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 2,
      child: InkWell(onTap: onpress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          
          child: Container(
            height: 65,
            
            decoration:   BoxDecoration(
            shape: BoxShape.circle  ,
             color:color,
            ),
            child: Center(child: Text(title,style: const TextStyle(fontSize: 20,color: Colors.white),)),
          ),
        ),
      ),
    );
  }
}