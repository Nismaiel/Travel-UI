import 'package:flutter/material.dart';
import 'package:traveller/BookingDB/DB_Service.dart';
import 'package:traveller/BookingDB/Bookings.dart';

Future<List<Bookingdb>> fetchOrdersFromDb() async {
  var dbHelper = DBHelper();
  Future<List<Bookingdb>> booking = dbHelper.getBookings();
  return booking;
}


Future getTotal() async {
  var dbHelper = DBHelper();
  Future total = dbHelper.getTotal();
  return total;
}

class MyBookings extends StatefulWidget {
  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  totalBar() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: getTotal(),
            builder: (context, snapshot) {
              return Container(height: 80,
                child: Column(
                  children: <Widget>[
                    Text('My Bookings',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 1)),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Text('Total',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Chip(
                          label: Text(
                            snapshot.data.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w400, color: Colors.white,fontSize: 20),
                          ),
                          backgroundColor: Colors.deepPurple,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  ScrollBookings() {
    return FutureBuilder(
        future: fetchOrdersFromDb(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  child: Text(
                                    snapshot.data[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '\$${snapshot.data[index].price}',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Per person',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            //TODO Stars
                            //  _buildRatingStars(activity.rating),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 80,height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    snapshot.data[index].start,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 90,height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    snapshot.data[index].end,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(children: <Widget>[Text('Stay Alerted for details, \n we will contact you within two days!',maxLines: 2,style: TextStyle(fontWeight: FontWeight.w600),)],),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 15,
                      bottom: 15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage(snapshot.data[index].image),
                          width: 110,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollBookings(),
      bottomNavigationBar: Container(
        child: totalBar(),
      ),
    );
  }
}
