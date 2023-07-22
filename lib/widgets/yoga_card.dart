import 'package:flutter/material.dart';

class YogaWidget extends StatefulWidget {
  var image;
  var title;
  var course;
  var session;
  var type;

  YogaWidget(this.image, this.title, this.course, this.session, this.type);

  @override
  State<YogaWidget> createState() => _YogaWidgetState();
}

class _YogaWidgetState extends State<YogaWidget> {
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
                fit: BoxFit.cover,
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
                  Spacer(),
                  widget.type == 0
                      ? Container()
                      : widget.type == 1
                          ? Container(
                              height: 20,
                              width: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "book",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          : Icon(Icons.lock),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
