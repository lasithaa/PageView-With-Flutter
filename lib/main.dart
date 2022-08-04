import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    ),
  );
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late PageController _pageController;
  int totalPage=3;
  void _onScroll(){
    print("AAA");
  }

  @override
  void initState(){
    _pageController=PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(

      //use pageview to go to one by one page
      body: PageView(
        controller: _pageController,
        children: [
          makePage(page :1,image: 'assets/travel3.jpg',title: "Yala National Park",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
          makePage(page :2,image: 'assets/travel2.jpg',title: "White Ray Hotel Tangalle",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
          makePage(page :3,image: 'assets/travel4.jpg',title: "Marbel Beach  Trinco",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
        ],
      ),
    );
  }
  Widget makePage({image,title,description,page}){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3,0.9],
            colors: [
              Colors.black.withOpacity(.7),
              Colors.black.withOpacity(.3),
            ]
          ),
        ),
        child: Padding(
         padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text("1",style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text("/"+totalPage.toString(),
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          margin:EdgeInsets.only(right: 3),
                          child: Icon(Icons.star,color: Colors.yellow,size: 20,),
                        ),
                        Container(
                          margin:EdgeInsets.only(right: 3),
                          child: Icon(Icons.star,color: Colors.yellow,size: 20,),
                        ),
                        Container(
                          margin:EdgeInsets.only(right: 3),
                          child: Icon(Icons.star,color: Colors.yellow,size: 20,),
                        ),
                        Container(
                          margin:EdgeInsets.only(right: 3),
                          child: Icon(Icons.star,color: Colors.yellow,size: 20,),
                        ),
                        Container(
                          margin:EdgeInsets.only(right: 3),
                          child: Icon(Icons.star,color: Colors.grey,size: 20,),
                        ),
                        Text("4.0",style: TextStyle(
                          color: Colors.white70,
                        ),),
                        Text("(2300)",style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),)

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Text(description,style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        height: 1.6,
                        fontSize: 15,
                      ),),
                    ),
                    SizedBox(height: 20,),
                    Text("Read More...",style: TextStyle(
                      color: Colors.white,
                    ),)

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
