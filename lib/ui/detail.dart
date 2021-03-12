import 'package:demo/ui/reservationdetail.dart';
import 'package:demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:readmore/readmore.dart';
import 'package:rxdart/rxdart.dart';

import 'face_on_scroll.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final images = [
    Image.asset(
      'assets/pexels-sourav-mishra-2710043/pexels-sourav-mishra-2710043.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/car2.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/car3.jpg',
      fit: BoxFit.cover,
    ),
  ];
  String overviewText = '';

  PageController _pageController;
  BehaviorSubject<int> streamController;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);
    streamController = BehaviorSubject<int>.seeded(0);

    overviewText =
        'Omakase means to respectfully entrust another to decide what is best. At Kasen, this means to trust Master Chef Shinji Murata to prepare a menuOmakase means to respectfully entrust another to decide what is best. At Kasen, this means to trust Master Chef Shinji Murata to prepare a menu';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 50,
        child: RaisedButton(
          color: Colors.blueGrey[800],
          child: Text(
            'INQUIRY >',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReservationDetailScreen()),
            );
          },
        ),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            stretch: true,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: SizedBox(
                height: 32.0,
                width: 32.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    padding: new EdgeInsets.all(0.0),
                    color: Colors.black,
                    icon: new Icon(Icons.arrow_back, size: 24.0),
                    onPressed: () => Navigator.pop(context),
                  ),
                )),
            expandedHeight: 322,
            collapsedHeight: 80,
            flexibleSpace: Stack(
              children: [
                ..._buildImageSlider(),
                _buildHeader(),
                _buildLikeButton(),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              ..._buildTitle(),
              _buildTag(),
              _buildPrice(),
              ..._buildOverview(),
              ..._buildPreview(),
              ..._buildReview(),
              ..._buildUserReview(),
              _buildReviewButton(),
            ],
          )),
        ],
      ),
    );
  }

  List<Widget> _buildImageSlider() {
    return [
      Positioned(
          child: PageView(
            controller: _pageController,
            children: images,
            onPageChanged: (pageIndex) {
              streamController.sink.add(pageIndex);
            },
          ),
          top: 0,
          left: 0,
          right: 0,
          bottom: 0),
      Positioned(
          bottom: 30.0,
          right: 0.0,
          left: 0.0,
          child: Center(
            child: StreamBuilder<int>(
              stream: streamController.stream,
              initialData: 0,
              builder: (ctx, snapshot) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length, (imageIndex) {
                    return Text(
                      '.',
                      style: TextStyle(
                          color: _pageController.page != null
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
          )),
    ];
  }

  Widget _buildHeader() {
    return Positioned(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
            ),
            border: Border.all(width: 0)),
      ),
      bottom: -1,
      left: 0,
      right: 0,
    );
  }

  Widget _buildLikeButton() {
    return Positioned(
      child: FadeOnScroll(
        scrollController: scrollController,
        fullOpacityOffset: 322,
        zeroOpacityOffset: 0,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              border: Border.all(color: Colors.black)),
          child: Icon(
            FontAwesome.heart,
            color: Colors.blueGrey[800],
          ),
        ),
      ),
      bottom: 0,
      right: 18,
    );
  }

  List<Widget> _buildTitle() {
    return [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 16, right: 20),
            child: Text(
              'Toyota Camry',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 25),
            )),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 6, bottom: 10),
          child: Text(
            'Car hire in 4 pick-up locations',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    ];
  }

  Widget _buildTag() {
    return Padding(
      padding: EdgeInsets.only(left: 20),
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

  Widget _buildPrice() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 16, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$830.00',
                  style: TextStyle(
                      color: HexColor('#414A5A'),
                      fontWeight: FontWeight.w500,
                      fontSize: 25)),
              Text('per 1/2 day',
                  style: TextStyle(color: HexColor('#8D929C'), fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildOverview() {
    return [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 46, right: 20),
            child: Text(
              'Overview',
              style: TextStyle(
                  color: HexColor('#414A5A'),
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            )),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 11, right: 20),
            child: ReadMoreText(
              overviewText,
              trimLines: 3,
              trimExpandedText: 'less',
              moreStyle: TextStyle(color: HexColor('#414A5A')),
              lessStyle: TextStyle(color: HexColor('#414A5A')),
              trimCollapsedText: 'more',
              trimMode: TrimMode.Line,
            )),
      ),
    ];
  }

  List<Widget> _buildPreview() {
    return [
      Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Image.asset(
              'assets/pexels-sourav-mishra-2710043/pexels-sourav-mishra-2710043.png',
              fit: BoxFit.cover,
              height: 186,
            ),
          )),
      Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 16, right: 20),
        child: Row(
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: Image.asset('assets/images/car.jpg',
                    fit: BoxFit.cover, height: 88),
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: Image.asset('assets/images/car2.jpg',
                    fit: BoxFit.cover, height: 88),
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: Image.asset('assets/images/car3.jpg',
                    fit: BoxFit.cover, height: 88),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _buildReview() {
    return [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 42, right: 20),
            child: Text(
              'Reviews',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            )),
      ),
      _buildRating()
    ];
  }

  Widget _buildRating() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange,
                ),
                child: Text(
                  '4.5',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < 3 ? Icons.star : Icons.star_border,
                    color: Colors.orange,
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

  List<Widget> _buildUserReview() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 16, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: new BorderRadius.circular(25.0),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/profile.jpg',
                ),
                width: 50.0,
                height: 50.0,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Guest User',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text('Hong Kong',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 14)),
                      ),
                      SizedBox(width: 30),
                      Flexible(
                        child: Text('Stayed in Octobor 2019',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 14)),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: HexColor('#414A5A'),
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('5 ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16)),
                            Text('/5 ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11)),
                            Text('Perfect',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14)),
                          ],
                        ),
                      )),
                  Container(
                    child: Text(
                      "Hotel is old style but it already been renovated. Nice view for river side room and I love the swimming pool which it's ease accessible.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Colors.black,
                  )
                ],
              ),
            )),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 16, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: new BorderRadius.circular(25.0),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/profile.jpg',
                ),
                width: 50.0,
                height: 50.0,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Guest User',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text('Hong Kong',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 14)),
                      ),
                      SizedBox(width: 30),
                      Flexible(
                        child: Text('Stayed in Octobor 2019',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 14)),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: HexColor('#414A5A'),
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('5 ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16)),
                            Text('/5 ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11)),
                            Text('Perfect',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14)),
                          ],
                        ),
                      )),
                  Container(
                    child: Text(
                      "Hotel is old style but it already been renovated. Nice view for river side room and I love the swimming pool which it's ease accessible. There is a riverside plaza connected with Avani hotel and it's just opposite of hotel.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    ];
  }

  Widget _buildReviewButton() {
    return Padding(
        padding:
            const EdgeInsets.only(left: 20.0, top: 37, right: 20, bottom: 37),
        child: SizedBox(
          width: double.infinity,
          height: 45,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: BorderSide(
                  color: HexColor('#414A5A').withOpacity(0.2), width: 0.75),
            ),
            color: HexColor('#B3B6BD').withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  size: 16,
                ),
                SizedBox(width: 10),
                Text(
                  'Write a review',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ));
  }

  @override
  void dispose() {
    _pageController.dispose();
    streamController.close();
    super.dispose();
  }
}
