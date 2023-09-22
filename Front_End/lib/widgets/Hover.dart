import 'package:flutter/material.dart';

class HoverPhoto extends StatefulWidget {
  final String imagePath;

  HoverPhoto({required this.imagePath});

  @override
  _HoverPhotoState createState() => _HoverPhotoState();
}

class _HoverPhotoState extends State<HoverPhoto> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle photo click
      },
      onHover: (hovering) {
        setState(() {
          isHovered = hovering;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0.0, 4.0),
                    blurRadius: 10.0,
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            widget.imagePath,
            width: 200.0,
            height: 150.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
