import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigatorButtonWidget extends StatefulWidget {
  final Function()?onTap;
  final String text;
  const NavigatorButtonWidget({super.key,required this.onTap,required this.text});

  @override
  State<NavigatorButtonWidget> createState() => _NavigatorButtonWidgetState();
}

class _NavigatorButtonWidgetState extends State<NavigatorButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 325.w,
                height: 20.h,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xff553B59))),
                    onPressed:widget.onTap,
                    child:Text(widget.text,style: TextStyle(color: Colors.white),) ),
              );
  }
}