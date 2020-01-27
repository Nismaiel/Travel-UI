import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traveller/BookingDB/Bookings.dart';
import 'package:traveller/models/hotel_model.dart';
import 'package:traveller/BookingDB/DB_Service.dart';
import 'package:traveller/BookingDB/MyBookings.dart';

class HotelScreen extends StatefulWidget {
  final Hotel hotel;

  HotelScreen({this.hotel});

  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  var dbHelper;
  var uniqueId;
  TextEditingController _MobileController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool num = false;
  String mobile = '*';

  Text _buildRatingStars(int ratings) {
    String stars = '';
    for (int i = 0; i < ratings; i++) {
      stars += '⭐';
    }
    return Text(stars);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    setState(() {
      uniqueId = DateTime.now().millisecondsSinceEpoch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                  child: Hero(
                    tag: widget.hotel.imageUrl,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        child: Image(
                          image: AssetImage(widget.hotel.imageUrl),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(
                                FontAwesomeIcons.sortAmountDown,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                Text(
                  widget.hotel.name,
                  style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                ),
                _buildRatingStars(widget.hotel.rating),
                SizedBox(
                  height: 16,
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      widget.hotel.address,
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.deepPurple,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //  _buildRatingStars(widget.hotel.rating),
                    Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '\$ ${widget.hotel.price} ',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Per night',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Program:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Adventure excursion webdesign traveler, website website blogger organized darn blogger pretty theme colorful traveling. Modern colorful theme cute adventure colorful excursion. Modern WordPress excursion blogger wanderlust design, excursion expedition traveler modern.',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            )),
          ],
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (_) => Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 300),
                      child: AlertDialog(
                        content: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter Mobile Number!!';
                                  }
                                  return "";
                                },
                                controller: _MobileController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    hintText: "Enter Mobile Number"),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                _formKey.currentState.reset();
                                Navigator.pop(context);
                              },
                              child: Text('Cancel')),
                          RaisedButton(
                            onPressed: () {
                              _formKey.currentState.validate();
                                Bookingdb hotel = Bookingdb(
                                    id: uniqueId,
                                    start: "023948987",
                                    rate: widget.hotel.rating,
                                    end: widget.hotel.address,
                                    name: widget.hotel.name,
                                    price: widget.hotel.price,
                                    image: widget.hotel.imageUrl);
                                _MobileController.clear();
                                dbHelper.save(hotel);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyBookings()));
                            },
                            child: Text(
                              'Book Now!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            color: Colors.deepPurple,
                          )
                        ],
                      ),
                    ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Book your room',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple),
            ),
          ),
        ));
  }
}
