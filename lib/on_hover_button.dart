import 'package:sprung/sprung.dart';
import 'package:flutter/material.dart';
class OnHoverButton extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
   OnHoverButton({Key? key, required this.builder,}):super (key: key);

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;
   
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final color =isHovered ? Colors.green : Colors.white;
    final hoveredTransform = Matrix4.identity()..translate(2,0,0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event)=> onEntered(true),
      onExit: (event)=> onEntered(false),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * 0.025),
          color: color,
        ),
        curve: Sprung.overDamped,
        duration: Duration(milliseconds: 200),
        transform: transform,
        child: widget.builder(isHovered)
        ),
      );
  }
  void onEntered(bool isHovered) => setState(() { 
    this.isHovered = isHovered;
    
    });
}