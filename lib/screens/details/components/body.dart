// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:apporder/models/product.dart';
import 'package:apporder/responsive/responsive_screen.dart';
import 'package:apporder/screens/details/components/contents.dart';
import 'package:apporder/screens/homes/components/background.dart';
import 'package:apporder/screens/homes/components/bottombars.dart';
import 'package:apporder/screens/homes/components/carousel.dart';
import 'package:apporder/screens/homes/components/top_bar.dart';
import 'package:apporder/screens/homes/components/topbars.dart';
import 'package:apporder/utils/custom.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final Product? snapshot;
  final GlobalKey<ScaffoldState> keys;
  const Body({Key? key, this.snapshot, required this.keys}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        scrollBehavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 500,
            pinned: true,
            snap: false,
            backgroundColor: Palette.animationColor,
            title: SizedBox(
              height: 80,
              child: Material(
                color: Colors.transparent,
                elevation: 0.0,
                child: Responsive.isDesktop(context)
                    ? TopBar()
                    : TopBars(keys: widget.keys),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              background: Container(
                color: Colors.black,
                height: 500,
                child: Background(
                    height: 500, width: Responsive.getSize(context).width),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Carousel(),
                    Divider(),
                    Contents(snapshot: widget.snapshot),
                    BottomBar()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// https://www.youtube.com/watch?v=3QctI7A9Rj4
