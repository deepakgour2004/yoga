import 'package:flutter/material.dart';

class LessonWidget extends StatefulWidget {
  var image;
  var title;
  var course;
  var session;

  LessonWidget(this.image, this.title, this.course, this.session);

  @override
  State<LessonWidget> createState() => _LessonWidgetState();
}

class _LessonWidgetState extends State<LessonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Container(
          height: 240,
          width: 240,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.image,
                fit: BoxFit.fill,
              ),
              Row(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.course,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(widget.session),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
