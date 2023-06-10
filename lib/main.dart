import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pazzal_game/data.dart';
import 'package:pazzal_game/page_1_buy.dart';
import 'package:pazzal_game/page_1_conu.dart';
import 'package:pazzal_game/page_1_puzz.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: pazzal_game(),
  ));
}

class pazzal_game extends StatefulWidget {
  const pazzal_game({Key? key}) : super(key: key);

  @override
  State<pazzal_game> createState() => _pazzal_gameState();
}

class _pazzal_gameState extends State<pazzal_game> {
  int Current_level = 0;
  SharedPreferences ?prefs;
  bool tamp = false;
  bool tamp1 = false;
  bool tamp2 = false;


  List list=[];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    get();
    list=List.filled(data.ans.length, "No");
  }

  get() async {
    prefs = await SharedPreferences.getInstance();
    Current_level = prefs!.getInt("cur_level") ?? 0;

    for(int i=0;i<Current_level;i++)
      {
        list[i]=prefs!.getString("puzzle_status$i");
      }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.jpg'), fit: BoxFit.fill),
          ),
          child: Container(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: Text(
                        "Math Puzzles",
                        style: TextStyle(
                            fontFamily: "f1",
                            fontSize: 40,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Row(
                children: [
                  Expanded(flex: 2,
                    child: Container(
                        margin: EdgeInsets.all(15),
                        height: 450,
                        width: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                AssetImage("images/blackboard_main_menu.png"),
                                fit: BoxFit.fill)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(onTapUp: (details) {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) {
                                return page_1_conu(Current_level);
                              },));
                              setState(() {

                              });
                              print("Topup");
                              tamp = false;
                            },

                              onTapDown: (details) {
                                tamp = true;
                                setState(() {});
                              },
                              onTapCancel: () {
                                tamp = false;
                                setState(() {});
                              },
                              child: Container(margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: (tamp) ? Border.all(
                                        width: 3, color: Colors.white) :null),
                                child: Text("CONTINUE", style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontFamily: "f1"),),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return page_1_puzz(Current_level,list);
                                    },));
                                setState(() {

                                });
                                tamp1 =false;

                              }, onTapDown: (details) {
                              tamp1 =true;
                              setState(() {

                              });
                              },onTapCancel: () {
                              tamp1 = false;
                              setState(() {});
                            },child: Container(margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: (tamp1) ? Border.all(
                                      width: 3, color: Colors.white) :null),
                              child: Text("PUZZLES", style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontFamily: "f1"),),
                            ),
                            ),
                            GestureDetector(onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) {
                                return page_1_buy();
                              },));
                              setState(() {

                              });
                              tamp2=false;

                            },onTapDown: (details) {
                              tamp2 =true;
                              setState(() {

                              });
                            },onTapCancel: () {
                              tamp2= false;
                              setState(() {});
                            },

                              child: Container(margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: (tamp2) ? Border.all(
                                        width: 3, color: Colors.white) :null),
                                child: Text("BUY PRP", style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontFamily: "f1"),),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/ltlicon.png"),
                              fit: BoxFit.fill)),
                    ),
                    InkWell(onTap: ()  {
                      Share.share('check out my website https://example.com');
                    },
                      child: Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.only(left: 150),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/shareus.png"),
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                    Expanded(flex: 2,
                      child: Container(
                        height: 30,
                        width: 30,


                        margin: EdgeInsets.only(left: 50),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/emailus.png"),
                              fit: BoxFit.fill,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
