import 'package:flutter/material.dart';


class TouchCallBack extends StatefulWidget{
  final Widget child;
  final VoidCallback onPressed;
  final VoidCallback onDoublePressed;
  final bool isfeed;
  final Color background;
  TouchCallBack({Key key,
    @required this.child,
    @required this.onPressed,
    this.onDoublePressed,
    this.isfeed:true,
    this.background:const Color(0xffd8d8d8),
  }):super(key:key);
  _TouchCallBackState createState() => _TouchCallBackState();
}

class _TouchCallBackState extends State<TouchCallBack> {
  Color color =  Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: color,
        child: widget.child,
      ),
      onTap: widget.onPressed,
      onDoubleTap: widget.onDoublePressed,
      onPanDown: (d) {
        if(widget.isfeed == false) return;
        setState(() {
         color = widget.background; 
        });
      },
      onTapUp: (d) {
           setState(() {
          color = Colors.transparent;
        });
      },
      onPanCancel: () {
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }
}