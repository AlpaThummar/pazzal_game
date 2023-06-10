import 'package:flutter/material.dart';
import 'package:pazzal_game/data.dart';
import 'package:pazzal_game/main.dart';
import 'package:pazzal_game/page_1_conu.dart';

class win_page extends StatefulWidget {
  int win_index;

  win_page(this.win_index);

  @override
  State<win_page> createState() => _win_pageState();
}

class _win_pageState extends State<win_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/background.jpg"),fit: BoxFit.fill)),
          child:
              Column( children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 80,
                //width: double.infinity,
                alignment: Alignment.bottomCenter,

                child: Center(
                  child: Text( textAlign: TextAlign.center,
                    "PUZZLE ${widget.win_index} COMPLETED",
                    style: TextStyle(
                        fontFamily: "f1",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff3f51b5)),
                  ),
                ),
              )
            ]),

            Container(
              height: 150,
              width: 150,

              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("images/trophy.png"),)),
            ),

            InkWell(onTap: () {
              if(widget.win_index<data.ans.length-1)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return page_1_conu(widget.win_index);},));
                }
                else{
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return page_1_conu(widget.win_index);
                },));
                  }


            },
              child: Container(
                height: 30,
                width: 100,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    "Continous",textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.grey,
                          Colors.white60,
                          Colors.grey,
                        ]),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return pazzal_game();
              },));
            },
              child: Container(
                height: 30,
                width: 100,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Text(textAlign: TextAlign.center,
                  "MAIN MENU",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 20),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.grey,
                          Colors.white60,
                          Colors.grey,
                        ]),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            Container(
              height: 30,
              width: 100,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              child: Text(textAlign: TextAlign.center,
                "BUY PRO",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: 20),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.grey,
                        Colors.white60,
                        Colors.grey,
                      ]),
                  borderRadius: BorderRadius.circular(5)),
            ),
            Container(
              height: 40,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: Text(textAlign: TextAlign.center,
                "SHARE THIS PUZZLE",
                style: TextStyle(
                    fontFamily: "f1",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3f51b5)),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  image:
                  DecorationImage(image: AssetImage("images/shareus.png")),gradient: LinearGradient(colors: [Colors.grey,
                Colors.white60,
                Colors.grey,],
                begin: Alignment.topLeft,
                end: Alignment.topCenter,)),
            ),


          ]),
        ),
      ),
    );
  }
}
