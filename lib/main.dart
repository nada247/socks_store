import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:socks_store/Page2.dart';


void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Socks(),
      )
  );
}
class Socks extends StatefulWidget {
  const Socks({super.key});

  @override
  State<Socks> createState() => _SocksState();
}

class _SocksState extends State<Socks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 300,
              padding: EdgeInsets.only(top: 60 , left: 25 , right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50), bottomRight: Radius.circular(50) ),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [
                        Color.fromRGBO(255, 250, 182, 1) ,
                        Color.fromRGBO(255, 239, 78, 1) ,
                      ])
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.menu , size: 25, color: Colors.grey[800],),
                  SizedBox(height: 15,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex:4 ,
                          child: Text("Best Online Socks Collection" ,
                            style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold , color: Colors.grey[800]),)),

                      Expanded(
                          flex:3 ,
                          child: Image.asset('assets/images/sock.png')
                      )
                    ],),
                ],),
            ),
            Transform.translate(
              offset: Offset(0, -35) ,
              child: Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 25),
                padding: EdgeInsets.only(left: 15 , top: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [BoxShadow(
                        color: Colors.black12 ,
                        blurRadius: 20 ,
                        offset: Offset(0, 10)
                    )]
                ),child:TextField(
                decoration: InputDecoration(
                    border: InputBorder.none ,
                    hintText: "Search" ,
                    suffixIcon: Icon(CupertinoIcons.search)
                ),
              ),
              ),
            ),
            //==============================================================
            Padding(padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Choose Type:" , style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 20),) ,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed: (){}, child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.pink[100] ,
                              borderRadius: BorderRadius.circular(5),
                            ),child: Text("Adult" , style: TextStyle(color: Colors.black54),),
                          )),

                          TextButton(onPressed: (){}, child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black12 ,
                              borderRadius: BorderRadius.circular(5),
                            ),child: Text("Kids" , style: TextStyle(color: Colors.white),),
                          ))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            //===================================
            SizedBox(height: 30,),
            Container(
              height: 280,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(top: 20 , left: 20),
                children: [
                  makeCard(image: "assets/images/socks-two.png" , context: context , starColor: Colors.blue , endColor: Colors.indigo),
                  makeCard(image: "assets/images/socks-one.png" , context: context , starColor: Colors.purpleAccent, endColor: Colors.pinkAccent),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
  Widget makeCard({starColor , endColor , image , context}){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageTransition(type: PageTransitionType.fade , child: SockPage()));
      },
      child: AspectRatio(
        aspectRatio: 4/5 ,
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              gradient: LinearGradient(
                  colors:[
                    starColor,endColor]
              ),
              boxShadow: [BoxShadow(color: Colors.black12 , blurRadius: 10 , offset: Offset(5, 10))]
          ),
          child: Center(
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }
}
//
