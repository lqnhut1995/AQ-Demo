import 'package:demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

enum NavigationType { Default, ReservationDetail }

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  Widget init(
      {NavigationType type = NavigationType.Default,
      String title,
      SliverPadding sliver,
      Widget widget}) {
    return _buildAppBar(type, title, widget: widget, sliver: sliver);
  }

  Widget _buildAppBar(NavigationType type, String title,
      {SliverPadding sliver, Widget widget}) {
    return SafeArea(
        child: _buildMenu(type, title, sliver: sliver, widget: widget));
  }

  Widget _buildMenu(NavigationType type, String title,
      {SliverPadding sliver, Widget widget}) {
    switch (type) {
      case NavigationType.ReservationDetail:
        return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: widget);
      default:
        return Scaffold(
          body: CustomScrollView(
            slivers: [_AppBar(title), sliver],
          ),
        );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _AppBar extends StatelessWidget {
  String title;

  _AppBar(this.title);

  @override
  Widget build(BuildContext context) {
    bool canPop = Navigator.of(context).canPop();

    return SliverAppBar(
      backgroundColor: HexColor('#414A5A'),
      shape: RoundedRectangleBorder(side: BorderSide.none),
      elevation: 0,
      pinned: true,
      stretch: true,
      expandedHeight: 200,
      automaticallyImplyLeading: false,
      excludeHeaderSemantics: true,
      title: Text(
        this.title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      leading: canPop
          ? IconButton(
              icon: Icon(Icons.keyboard_backspace),
              onPressed: () => Navigator.of(context).pop())
          : null,
      actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [StretchMode.zoomBackground],
        background: Container(
          color: HexColor('#F9F8FD'),
          child: Stack(
            fit: StackFit.expand,
            children: [
              AppBarBanner(
                "assets/bg/banner01.png",
                flex: 2,
                subFlex: 3,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 24,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          color: Colors.blueGrey[50],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Feather.filter,
                                size: 13,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Filter',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          color: HexColor('#5D9AF7'),
                          child: Text(
                            '35 Offers',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarBanner extends StatelessWidget {
  final String path;
  final int flex;
  final int subFlex;

  const AppBarBanner(
    this.path, {
    Key key,
    this.flex = 2,
    this.subFlex = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: flex,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(path, fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(flex: subFlex, child: Container()),
      ],
    );
  }
}
