import 'package:flutter/material.dart';
import 'package:seedly/ud_widgets/searchWidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
        // actions: [
          
        // ],
      // ),
      body: Column(
        children: [
          
          Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for a plant..',
                        ),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          
          
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              'Most Popular',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}

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