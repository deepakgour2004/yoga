import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga/provider/page_index_provider.dart';

bottomNavigatopnBar(context) {
  var pageIndexProvider = Provider.of<PageIndexProvider>(context);
  return Container(
    height: 70,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      GestureDetector(
          onTap: () {
            pageIndexProvider.changeIndex(0);
          },
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: pageIndexProvider.pageIndex == 0
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3))),
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    color: pageIndexProvider.pageIndex == 0
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  Text("Home")
                ],
              ))),
      GestureDetector(
          onTap: () {
            pageIndexProvider.changeIndex(1);
          },
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: pageIndexProvider.pageIndex == 1
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3))),
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Book-open1.png",
                  ),
                  Text("Learn")
                ],
              ))),
      GestureDetector(
          onTap: () {
            pageIndexProvider.changeIndex(2);
          },
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: pageIndexProvider.pageIndex == 2
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3))),
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Layout.png",
                  ),
                  Text("Hub")
                ],
              ))),
      GestureDetector(
          onTap: () {
            pageIndexProvider.changeIndex(3);
          },
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: pageIndexProvider.pageIndex == 3
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3))),
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Comment.png",
                  ),
                  Text("Chat")
                ],
              ))),
      GestureDetector(
          onTap: () {
            pageIndexProvider.changeIndex(4);
          },
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: pageIndexProvider.pageIndex == 4
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3))),
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle_outlined),
                  Text("Profile")
                ],
              ))),
    ]),
  );
}
