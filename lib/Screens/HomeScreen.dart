import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travelapp/Models/Destination.dart';
import 'package:travelapp/Screens/DestinationScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,bottom: 0),
              child: Text(
                "Welcome Keshav!",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                  Icon(
                    Icons.backpack,
                    size: 30,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    hintText: 'Where to go next?',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 10),
              child: Text(
                "Popular Destinations",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              )
            ),
            Container(
              height: MediaQuery.of(context).size.height - 310,
              child: PageView.builder(
                  itemCount: destinations.length,
                  controller: PageController(viewportFraction: 0.7),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (context, i) {
                    return Transform.scale(
                      scale: i == _index ? 1.0 : 0.9,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DestinationScreen(
                                    destination: destinations[i],
                                  )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height - 350,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(destinations[i].image),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(2, 3),
                                    )
                                  ]),
                            ),
                            Text(
                              destinations[i].name,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(30),
          ),
          child: GNav(
            gap: 8,
            activeColor: Colors.blue,
            iconSize: 25,
            padding: EdgeInsets.all(5),
            duration: Duration(milliseconds: 800),
            tabBackgroundColor: Colors.white,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_outlined,
                text: 'Favorite',
              ),
              GButton(
                icon: Icons.person_pin_sharp,
                text: 'Experience',
              ),
              GButton(
                icon: Icons.person_outline,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
