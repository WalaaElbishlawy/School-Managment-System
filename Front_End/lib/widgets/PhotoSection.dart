import 'package:flutter/material.dart';
import 'package:school_system/Home/home.dart';

class PhotoSection extends StatelessWidget {
  final String imagePath;
  final String tag;

  PhotoSection({required this.imagePath, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Animated Photo with Hero animation
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetail(
                    imagePath: imagePath,
                    tag: tag,
                  ),
                ),
              );
            },
            child: Hero(
              tag: tag,
              child: TweenAnimationBuilder(
                duration: Duration(milliseconds: 500),
                tween: Tween<double>(begin: 1.0, end: 1.2),
                builder: (BuildContext context, double value, Widget? child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: Image.asset(
                  imagePath,
                  width: 300,
                  height: 200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
