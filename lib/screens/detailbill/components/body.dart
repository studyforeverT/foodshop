// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:apporder/models/cart.dart';
import 'package:apporder/responsive/responsive_screen.dart';
import 'package:apporder/screens/detailbill/components/contents.dart';
import 'package:apporder/screens/homes/components/background.dart';
import 'package:apporder/screens/homes/components/bottombars.dart';
import 'package:apporder/screens/homes/components/carousel.dart';
import 'package:apporder/screens/homes/components/top_bar.dart';
import 'package:apporder/screens/homes/components/topbars.dart';
import 'package:apporder/utils/custom.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final List<CartModel> snapshot;
  final String codebill;
  final String name;
  final String phone;
  final String address;
  final GlobalKey<ScaffoldState> keys;
  const Body(
      {Key? key,
      required this.snapshot,
      required this.codebill,
      required this.name,
      required this.phone,
      required this.address,
      required this.keys})
      : super(key: key);

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
                    Contents(
                      snapshot: widget.snapshot,
                      codebill: widget.codebill,
                      name: widget.name,
                      phone: widget.phone,
                      address: widget.address,
                    ),
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
