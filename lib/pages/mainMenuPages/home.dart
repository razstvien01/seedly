//* This .dart file is used for designing Home page UI in main menu folder

import 'package:flutter/material.dart';


import 'package:seedly/data/category_model.dart';
import 'package:seedly/data/plant_data.dart';
import 'package:seedly/pages/mainMenuPages/details_page.dart';
import 'package:seedly/core/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller = PageController();
  int selectId = 0;
  int activePage = 0;
  
  @override
  void initState(){
    controller = PageController(viewportFraction: 0.6, initialPage: 0);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  buildTopSection(),
                  
                  SizedBox(
                    height: 35.0,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        for (int i = 0; i < categories.length; i++)
                          GestureDetector(
                            onTap: () {
                            setState(() => selectId = categories[i].id);
                            },
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categories[i].name,
                            style: TextStyle(
                              color: selectId == i
                                    ? Colors.green[300]
                                    : Colors.black.withOpacity(0.7),
                                fontSize: 16.0,
                              ),
                            ),
                            if (selectId == i)
                              const CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  SizedBox(
                    height: 320.0,
                    child: PageView.builder(
                    itemCount: plants.length,
                    controller: controller,
                      physics: const BouncingScrollPhysics(),
                      padEnds: false,
                      pageSnapping: true,
                      onPageChanged: (value) => setState(() => activePage = value),
                      itemBuilder: (itemBuilder, index) {
                        bool active = index == activePage;
                        return slider(active, index);
                      },
                    ),
                  ),
                  
                  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                      color: black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  
                  Image.asset(
                    'assets/icons/more.png',
                    color: green,
                    height: 20,
                        ),
                  ],
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(
              height: 130.0,
              child: ListView.builder(
                itemCount: populerPlants.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 20.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (itemBuilder, index) {
                  return Card(
                    child: Container(
                      width: 200.0,
                      margin: const EdgeInsets.only(right: 20, bottom: 10),
                      decoration: BoxDecoration(
                        color: lightGreen,
                        boxShadow: [
                          BoxShadow(
                            color: green.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                // 'assets/icons/more.png',
                                populerPlants[index].imagePath,
                                width: 70,
                                height: 70,
                              ),
                              const SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    populerPlants[index].name,
                                    style: TextStyle(
                                      color: black.withOpacity(0.7),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    '\$${populerPlants[index].price.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: black.withOpacity(0.4),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Positioned(
                            right: 20,
                            bottom: 20,
                            child: CircleAvatar(
                              backgroundColor: green,
                              radius: 15,
                              child: Image.asset(
                                'assets/icons/add.png',
                                color: white,
                                height: 15,
                              ),
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
                                'assets/icons/usericon.png', 
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
            border: Border.all(color: Colors.green),
            color: Colors.grey[200],
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
  
  AnimatedContainer slider(active, index) {
    double margin = active ? 20 : 30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: mainPlantsCard(index),
    );
  }

  Widget mainPlantsCard(index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => DetailsPage(plant: plants[index]),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
          ],
          border: Border.all(color: green, width: 2),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: lightGreen,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                  image: AssetImage(plants[index].imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: CircleAvatar(
                backgroundColor: green,
                radius: 15,
                child: Image.asset(
                  'assets/icons/add.png',
                  color: white,
                  height: 15,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  '${plants[index].name} - \$${plants[index].price.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
