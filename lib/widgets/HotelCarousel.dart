import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traveller/models/hotel_model.dart';
import 'package:traveller/screens/hotelScreen.dart';

class HotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Exclusive Hotels',
              style: TextStyle(
                  fontSize: 22,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold),
            ),
            FlatButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ))
          ],
        ),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return GestureDetector(
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HotelScreen(hotel: hotel,)));},
                child: Container(
                  width: 240,
                  margin: EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 15.0,
                        child: Container(

                          height: 120,
                          width: 240,
                          decoration: BoxDecoration(
                              boxShadow: [ BoxShadow(color: Colors.blue,
                                  blurRadius: 6.0,
                                  offset: Offset(0.1, 2.0))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${hotel.name} ',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2),
                                ),
                                Text('\$${hotel.price}/night', style: TextStyle(
                                    fontSize: 15, color: Colors.grey),),

                                Row(
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.locationArrow, size: 10,),
                                    Text(
                                      '${hotel.address}',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.1, 2.0),
                                  blurRadius: 6.0)
                            ]),
                        child: Stack(
                          children: <Widget>[
                            Hero(tag: hotel.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  height: 180.0,
                                  width: 220.0,
                                  image: AssetImage(hotel.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(left: 10.0,
                              bottom: 10.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
