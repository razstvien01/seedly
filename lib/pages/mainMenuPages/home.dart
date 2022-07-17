//* This .dart file is used for designing Home page UI in main menu folder

import 'package:flutter/material.dart';

//* User defined widgets
import 'package:seedly/ud_widgets/tfsearchbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SafeArea(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
            
    //         TextFieldSearchBar(), //* Search bar
            
    //         const Padding(
    //           padding: EdgeInsets.all(25.0),
    //           child: Text(
    //             'Most Popular',
    //             style: TextStyle(
    //               color: Colors.black,
    //               fontSize: 20,
                  
    //             ),
    //           ),
    //         ),
            
    //       ],
    //     ),
      // ),
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  buildTopSection(),
                  
                  SizedBox(height: 20,),
                  
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Top', style: TextStyle(color: Colors.grey),),
                        Text('Indoor', style: TextStyle(color: Colors.grey)),
                        Text('Outdoor', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 20,),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTopSection() {
    return Column(
      children: [
        Row(
                      children: [
                        Text(
                          'Discover', 
                        style: TextStyle(
                            fontSize: 35,
                          fontWeight: FontWeight.w800,
                        ),),
                        
                        Spacer(),
                        
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/images/usericon.png', 
                              ),
                            ),
                            
                            Positioned(
                              right: 0,
                              child: Container(
                                alignment: Alignment.center,
                                height: 19,
                                width: 19,
                                child: Text(
                                  '2',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                    style: BorderStyle.solid,
                                    
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.mic),
            ),
          ),
        ),
      ],
    );
  }
}

//* This class is use for searching library for search bar soon
class CustomSearchDelegate extends SearchDelegate{
  List<String> searchTerms = [
    'Apple',
    'Banana',
    'Pear',
    'Watermelons',
    'Oranges',
    'Blueberries',
    'Strawberries',
    'Raspberries',
  ];
  
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    //* To clear the query string
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //* This would make sure that we can leave and close the search bar
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
        
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    
    for(var plant in searchTerms) {
      if(plant.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(plant);
      }
    }
    
    //* returns a list of item results
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    
    for(var plant in searchTerms) {
      if(plant.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(plant);
      }
    }
    
    //* returns a list of item results
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
  
}