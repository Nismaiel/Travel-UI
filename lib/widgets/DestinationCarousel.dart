import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traveller/models/destination_model.dart';
import 'package:traveller/models/hotel_model.dart';
import 'package:traveller/screens/destintionScreen.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Top Destinations',
              style: TextStyle(
                  fontSize: 22,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold),
            ),
            FlatButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: TextStyle(color: Colors.blue,fontSize: 15),
                ))
          ],
        ),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>DestinationScreen(destination: destination,)));},
                child: Container(
                  width: 210,
                  margin: EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 15.0,
                        child: Container(

                          height: 120,
                          width: 200,
                          decoration: BoxDecoration(
                            boxShadow:[ BoxShadow(color: Colors.black26,blurRadius: 6.0,offset: Offset(0.1,2.0))],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${destination.activities.length} activities',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2),
                                ),
                                Text(
                                  '${destination.description}',
                                  style: TextStyle(color: Colors.grey),
                                )
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
                            Hero(
                              tag: destination.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  height: 180.0,
                                  width: 180.0,
                                  image: AssetImage(destination.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(left: 10.0,
                              bottom: 10.0,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    destination.city,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        letterSpacing: 1.2),
                                  ),
                                  Row(
                                    children: <Widget>[
                                     Icon(FontAwesomeIcons.locationArrow,size: 10,color: Colors.white ,),
                                      SizedBox(width: 5.0,),
                                      Text(
                                        destination.country,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
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
