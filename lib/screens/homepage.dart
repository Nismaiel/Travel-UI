import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traveller/BookingDB/MyBookings.dart';
import 'package:traveller/widgets/DestinationCarousel.dart';
import 'package:traveller/widgets/HotelCarousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _currentTap = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Colors.grey,
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          _icons[index],
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 50.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 120),
            child: Text(
              'What you would like to find?',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

          ),
          SizedBox(height: 30,),
          IconButton(icon: Icon(Icons.hotel,color: Colors.blue,size: 30,), onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyBookings()));},alignment: Alignment.topLeft,),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons
                .asMap()
                .entries
                .map((MapEntry map) => _buildIcon(map.key))
                .toList(),
          ),
          SizedBox(
            height: 30,
          ),
          DestinationCarousel(),
          SizedBox(
            height: 30,
          ),
          HotelCarousel()
        ],
      )),
      bottomNavigationBar:
          BottomNavigationBar(onTap: (int value){setState(() {
            _currentTap=value;
          });},currentIndex: _currentTap, items: [
        BottomNavigationBarItem(

            icon: Icon(
              Icons.search,
              size: 30,
            ),
            title: SizedBox.shrink()),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30,
            ),
            title: SizedBox.shrink()),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://static.turbosquid.com/Preview/2015/09/01__06_24_22/Globeworld1.jpg8e9a764e-96a7-41a4-a388-8f3982386bf7Original.jpg'),
            ),
            title: SizedBox.shrink()),
      ]),
    );
  }
}
