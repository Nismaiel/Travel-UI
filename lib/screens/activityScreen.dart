import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traveller/BookingDB/Bookings.dart';
import 'package:traveller/models/activity_model.dart';
import 'package:traveller/BookingDB/DB_Service.dart';
import 'package:traveller/BookingDB/MyBookings.dart';
class ActivityScreen extends StatefulWidget {
  final Activity activity;

  ActivityScreen({this.activity});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {

  var dbHelper;
  var uniqueId;


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
    dbHelper=DBHelper();
    setState(() {
      uniqueId=DateTime.now().millisecondsSinceEpoch;

    });
  }

  @override
  Widget build(BuildContext context) {
    String start=widget.activity.startTimes[0];
    String end=widget.activity.startTimes[1];

    return Scaffold(
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
                    tag: widget.activity.imageUrl,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        child: Image(
                          image: AssetImage(widget.activity.imageUrl),
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
                    Row(children: <Widget>[
                      Expanded(
                        child: Text(
                          widget.activity.name,
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      IconButton(icon: Icon(Icons.location_on), onPressed: () {})
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildRatingStars(widget.activity.rating),
                        Card(
                            elevation: 10,
                            child: Text(
                              '\$ ${widget.activity.price} ',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
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
                      'Adventure excursion webdesign traveler, website website blogger organized darn blogger pretty theme colorful traveling. Modern colorful theme cute adventure colorful excursion. Modern WordPress excursion blogger wanderlust design, excursion expedition traveler modern.',style: TextStyle(fontWeight: FontWeight.w400),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.activity.startTimes[0],
                                style:
                                TextStyle(fontSize: 20, color: Colors.deepPurple),
                              ),
                            ),
                            elevation: 10,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.activity.startTimes[1],
                                style:
                                TextStyle(fontSize: 20, color: Colors.deepPurple),
                              ),
                            ),
                            elevation: 10,
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
        bottomNavigationBar: GestureDetector(
          onTap: (){
            Bookingdb book=Bookingdb(
              id: uniqueId,
              image: widget.activity.imageUrl,
              price: widget.activity.price,
              name: widget.activity.name,
              start: start,
              end:end,
              rate: widget.activity.rating
            );
          dbHelper.save(book);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBookings()));

          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Book your Seats',
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
