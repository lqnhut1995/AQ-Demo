import 'dart:async';

import 'package:demo/ui/detail.dart';
import 'package:demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import 'base_navigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulState<HomeScreen> {
  final images = [
    Image.asset(
        'assets/pexels-sourav-mishra-2710043/pexels-sourav-mishra-2710043.png',
        fit: BoxFit.cover),
    Image.asset('assets/images/car2.jpg', fit: BoxFit.cover),
    Image.asset('assets/images/car3.jpg', fit: BoxFit.cover),
  ];

  List<PageController> _pageControllers;
  List<BehaviorSubject<int>> streamControllers;
  var contentLength = 10;

  @override
  void initState() {
    super.initState();

    _pageControllers = List.generate(contentLength, (index) {
      return PageController(initialPage: 0);
    });

    streamControllers = List.generate(contentLength, (index) {
      final stream = BehaviorSubject<int>.seeded(0);
      return stream;
    });
  }

  @override
  Widget build(BuildContext context) {
    return super
        .init(title: 'Thailan\n20/08/2020 - 21/08/2020', sliver: _buildBody());
  }

  SliverPadding _buildBody() {
    return SliverPadding(
      padding: EdgeInsets.only(top: 0.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen()),
              );
            },
            child: Card(
              margin: EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 20),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(
                  color: HexColor('#CFD0D1'),
                  width: 0.75,
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      ..._buildImageSlider(index),
                      _buildPrice()
                    ],
                  ),
                  ..._buildTitle(),
                  _buildTag(),
                  _buildRating(),
                ],
              ),
            ),
          ),
          childCount: contentLength,
        ),
      ),
    );
  }

  List<Widget> _buildImageSlider(int index) {
    return [
      Container(
        height: 250,
        child: PageView(
          controller: _pageControllers[index],
          children: images,
          onPageChanged: (pageIndex) {
            streamControllers[index].sink.add(pageIndex);
          },
        ),
      ),
      Positioned(
        child: StreamBuilder<int>(
          stream: streamControllers[index].stream,
          initialData: 0,
          builder: (ctx, snapshot) {
            return Row(
              children: List.generate(images.length, (imageIndex) {
                return Text(
                  '.',
                  style: TextStyle(
                      color: _pageControllers[index].page != null
                          ? snapshot.data == imageIndex
                              ? Colors.white
                              : Colors.grey
                          : Colors.grey,
                      fontSize: 70),
                );
              }),
            );
          },
        ),
        right: 14,
        bottom: 0,
      ),
    ];
  }

  Widget _buildPrice() {
    return Positioned(
      child: Container(
          padding: EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Colors.blueGrey[800]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\$220.00',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 26)),
              Text('per day',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 14)),
            ],
          )),
      left: 0,
      bottom: -30,
    );
  }

  List<Widget> _buildTitle() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 57, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Toyota Camry',
              style: TextStyle(
                  color: HexColor('#414A5A'),
                  fontWeight: FontWeight.w400,
                  fontSize: 22),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Icon(
                Icons.person,
                size: 20,
                color: HexColor('#414A5A'),
              ),
              SizedBox(width: 10),
              Text('4',
                  style: TextStyle(fontSize: 16, color: HexColor('#414A5A'))),
            ]),
          ],
        ),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 6, bottom: 10),
          child: Text(
            'Car hire in 4 pick-up locations',
            style: TextStyle(
                color: HexColor('#414A5A'), fontWeight: FontWeight.w400),
          ),
        ),
      ),
    ];
  }

  Widget _buildTag() {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            spacing: 10,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: HexColor('#414A5A').withOpacity(0.2), width: 0.5),
                  color: HexColor('#B3B6BD').withOpacity(0.2),
                ),
                child: Text('Camry',
                    style: TextStyle(fontSize: 16, color: HexColor('#414A5A'))),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: HexColor('#414A5A').withOpacity(0.2), width: 0.5),
                  color: HexColor('#B3B6BD').withOpacity(0.2),
                ),
                child: Text('Automatic',
                    style: TextStyle(fontSize: 16, color: HexColor('#414A5A'))),
              ),
            ],
          )),
    );
  }

  Widget _buildRating() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, top: 42, bottom: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: HexColor('#FFB005'),
                ),
                child: Text(
                  '4.5',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                children: List.generate(5, (index) {
                  return index < 4
                      ? Icon(
                          Icons.star,
                          color: HexColor('#FFB005'),
                        )
                      : Icon(
                          Icons.star,
                          color: HexColor('#FFB005').withOpacity(0.3),
                        );
                }),
              )
            ],
          ),
          Flexible(
            child: Text('(456 Reviews)',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    streamControllers.forEach((element) {
      element.close();
    });
    _pageControllers.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }
}
