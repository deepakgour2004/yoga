import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga/provider/page_index_provider.dart';
import 'package:yoga/screens/home.dart';
import 'package:yoga/widgets/bottom_bar.dart';
import 'package:yoga/widgets/top_bar.dart';

class YogaUi extends StatefulWidget {
  const YogaUi({super.key});

  @override
  State<YogaUi> createState() => _YogaUiState();
}

var pages = [Home(), Container(), Container(), Container(), Container()];

class _YogaUiState extends State<YogaUi> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var pageIndexProvider = Provider.of<PageIndexProvider>(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: applicationTopBar(),
            bottomNavigationBar: bottomNavigatopnBar(context),
            body: pages[pageIndexProvider.pageIndex]));
  }
}
