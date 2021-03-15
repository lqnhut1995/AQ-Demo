import 'package:demo/utils.dart';
import 'package:flutter/material.dart';

enum SelectPlaceType { PickUp, DropOff }

class SelectPlaceWidget extends StatelessWidget {
  SelectPlaceWidget(this.type, this.selectedPlace);

  SelectPlaceType type;
  String selectedPlace;
  List<String> pickupPlaces = [
    'HHQ - Prachuap Khiri Khan, Thailand',
    'HHQ - New York, USA',
    'HHQ - London, UK'
  ];
  List<String> dropoffPlaces = [
    'HHP - Mumbai, India',
    'HHP - Hong Kong, Hong Kong',
    'HHP - Shanghai, China'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#414A5A'),
          title: Text(
            'Pick Up Place',
            style: TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.w300),
          ),
          leading: IconButton(
            padding: new EdgeInsets.all(0.0),
            color: Colors.white,
            icon: new Icon(Icons.arrow_back, size: 24.0),
            onPressed: () => Navigator.pop(context, null),
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          height: 50,
          child: RaisedButton(
            color: Colors.blueGrey[800],
            child: Text(
              'Select',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            onPressed: () {
              Navigator.pop(context, selectedPlace);
            },
          ),
        ),
        body: ListView.builder(
          itemCount: type == SelectPlaceType.PickUp
              ? pickupPlaces.length
              : dropoffPlaces.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              title: type == SelectPlaceType.PickUp
                  ? Text(pickupPlaces[index])
                  : Text(dropoffPlaces[index]),
              trailing: type == SelectPlaceType.PickUp
                  ? selectedPlace == pickupPlaces[index]
                      ? Icon(Icons.check)
                      : null
                  : selectedPlace == dropoffPlaces[index]
                      ? Icon(Icons.check)
                      : null,
              onTap: () {
                selectedPlace = type == SelectPlaceType.PickUp
                    ? (pickupPlaces[index])
                    : (dropoffPlaces[index]);
                (context as Element).markNeedsBuild();
              },
            );
          },
        ));
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.all(0),
      color: HexColor('#F9F8FD'),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.only(left: 10, right: 10),
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
