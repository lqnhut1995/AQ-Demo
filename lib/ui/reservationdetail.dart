import 'package:demo/textfield_widget.dart';
import 'package:demo/utils.dart';
import 'package:flutter/material.dart';

import 'base_navigation.dart';

class ReservationDetailScreen extends StatefulWidget {
  @override
  _ReservationDetailScreenState createState() =>
      _ReservationDetailScreenState();
}

class _ReservationDetailScreenState
    extends BaseStatefulState<ReservationDetailScreen> {
  TextEditingController firstNameCon = TextEditingController();
  TextEditingController lastNameCon = TextEditingController();
  TextEditingController emailNameCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController specialRequestCon = TextEditingController();

  bool agreeTerm = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#414A5A'),
          title: Text(
            'Reservation Detail',
            style: TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.w300),
          ),
          leading: IconButton(
            padding: new EdgeInsets.all(0.0),
            color: Colors.white,
            icon: new Icon(Icons.arrow_back, size: 24.0),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          height: 50,
          child: RaisedButton(
            color: Colors.blueGrey[800],
            child: Text(
              'SUBMIT',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            onPressed: () {},
          ),
        ),
        body: ListView(
          children: [_buildBody()],
        ));
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.all(0),
      color: HexColor('#F9F8FD'),
      child: Column(
        children: [
          Card(
            color: HexColor('#FFFFFF'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                color: HexColor('#414A5A').withOpacity(0.2),
                width: 0.5,
              ),
            ),
            margin: EdgeInsets.all(20),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ..._buildFirstName(),
                ..._buildLastName(),
                ..._buildEmail(),
                ..._buildPhone(),
                ..._buildPickUpPlace(),
                ..._buildDropOffPlace(),
                ..._buildDate(),
                ..._buildSpecialRequest(),
              ],
            ),
          ),
          _buildPolicy(),
          _buildAgreeTermButton()
        ],
      ),
    );
  }

  List<Widget> _buildFirstName() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Align(alignment: Alignment.topLeft, child: Text('First Name')),
      ),
      TextFieldWidget(
        padding: EdgeInsets.only(left: 20, right: 20, top: 6),
        hint: '',
        inputType: TextInputType.text,
        iconColor: Colors.black54,
        textController: firstNameCon,
        inputAction: TextInputAction.next,
        autoFocus: false,
        isIcon: false,
        onChanged: (value) {},
        onFieldSubmitted: (value) {},
      )
    ];
  }

  List<Widget> _buildLastName() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Align(alignment: Alignment.topLeft, child: Text('Last Name')),
      ),
      TextFieldWidget(
        padding: EdgeInsets.only(left: 20, right: 20, top: 6),
        hint: '',
        inputType: TextInputType.text,
        iconColor: Colors.black54,
        textController: lastNameCon,
        inputAction: TextInputAction.next,
        autoFocus: false,
        isIcon: false,
        onChanged: (value) {},
        onFieldSubmitted: (value) {},
      )
    ];
  }

  List<Widget> _buildEmail() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child:
            Align(alignment: Alignment.topLeft, child: Text('Email address')),
      ),
      TextFieldWidget(
        padding: EdgeInsets.only(left: 20, right: 20, top: 6),
        hint: '',
        inputType: TextInputType.emailAddress,
        iconColor: Colors.black54,
        textController: emailNameCon,
        inputAction: TextInputAction.next,
        autoFocus: false,
        isIcon: false,
        onChanged: (value) {},
        onFieldSubmitted: (value) {},
      )
    ];
  }

  List<Widget> _buildPhone() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Align(alignment: Alignment.topLeft, child: Text('Mobile phone')),
      ),
      TextFieldWidget(
        padding: EdgeInsets.only(left: 20, right: 20, top: 6),
        hint: '',
        inputType: TextInputType.phone,
        iconColor: Colors.black54,
        textController: phoneCon,
        inputAction: TextInputAction.next,
        autoFocus: false,
        isIcon: false,
        onChanged: (value) {},
        onFieldSubmitted: (value) {},
      )
    ];
  }

  List<Widget> _buildPickUpPlace() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Align(alignment: Alignment.topLeft, child: Text('Pick-up')),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 6, right: 20),
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: double.infinity,
            height: 53,
            child: Center(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                color: HexColor('#B3B6BD').withOpacity(0.2),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'HHQ - Prachuap Khiri Khan, Thailand',
                    style: TextStyle(color: HexColor('#414A5A'), fontSize: 16),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildDropOffPlace() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Align(alignment: Alignment.topLeft, child: Text('Drop-off')),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 6, right: 20),
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: double.infinity,
            height: 53,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              color: HexColor('#B3B6BD').withOpacity(0.2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'HHP - Hong Kong, Hong Kong',
                  style: TextStyle(color: HexColor('#414A5A'), fontSize: 16),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildDate() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Align(alignment: Alignment.topLeft, child: Text('Date')),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 6, right: 20),
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: double.infinity,
            height: 53,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              color: HexColor('#B3B6BD').withOpacity(0.2),
              child: Row(
                children: [
                  Text(
                    '28/08/2020',
                    style: TextStyle(color: HexColor('#414A5A'), fontSize: 16),
                  ),
                  Text(
                    ' | ',
                    style: TextStyle(
                        color: HexColor('#414A5A').withOpacity(0.2),
                        fontSize: 16),
                  ),
                  Text(
                    '28/08/2020',
                    style: TextStyle(color: HexColor('#414A5A'), fontSize: 16),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildSpecialRequest() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child:
            Align(alignment: Alignment.topLeft, child: Text('Special request')),
      ),
      Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 20),
        height: 6 * 24.0,
        child: TextField(
          controller: specialRequestCon,
          maxLines: 6,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(4.0),
                ),
                borderSide: BorderSide(
                    color: HexColor('#414A5A').withOpacity(0.2), width: 0.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(4.0),
                ),
                borderSide: BorderSide(
                    color: HexColor('#414A5A').withOpacity(0.2), width: 0.5)),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(4.0),
                ),
                borderSide: BorderSide(
                    color: HexColor('#414A5A').withOpacity(0.2), width: 0.5)),
            hintText: "",
            fillColor: HexColor('#B3B6BD').withOpacity(0.2),
            filled: true,
          ),
          onChanged: (value) {},
          onSubmitted: (value) {},
        ),
      )
    ];
  }

  Widget _buildPolicy() {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () {},
            child: Text(
              'Cancellation Policy',
              style: TextStyle(
                color: HexColor('#5D9AF7'),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ));
  }

  Widget _buildAgreeTermButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 20, top: 34, bottom: 25),
      child: GestureDetector(
        child: Container(
          child: Row(
            children: [
              agreeTerm
                  ? Icon(Icons.check_box, color: HexColor('#5D9AF7'))
                  : Icon(Icons.check_box_outline_blank,
                      color: HexColor('#5D9AF7')),
              SizedBox(width: 13),
              Text('Accept payment term and cancellation policy')
            ],
          ),
        ),
        onTap: () {
          setState(() {
            agreeTerm = !agreeTerm;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    firstNameCon.dispose();
    lastNameCon.dispose();
    emailNameCon.dispose();
    phoneCon.dispose();
    super.dispose();
  }
}
