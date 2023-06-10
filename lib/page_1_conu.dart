import 'package:flutter/material.dart';
import 'package:pazzal_game/data.dart';
import 'package:pazzal_game/main.dart';
import 'package:pazzal_game/page_1_conu_win.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class page_1_conu extends StatefulWidget {
  int? cur_level = 0;

  page_1_conu(this.cur_level);

  @override
  State<page_1_conu> createState() => _page_1_conuState();
}

class _page_1_conuState extends State<page_1_conu> {
  int current_level = 0;
  String ans = "";

  SharedPreferences? prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.cur_level != null) {
      current_level = widget.cur_level!;
    } else
      current_level = 0;

    get();
  }

  get() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      child: Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/gameplaybackground.jpg"),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {


                            if (prefs!.getInt("Time") == 1) {
                              int second;
                              DateTime t2 = DateTime.now();

                              Duration diff = t2.difference(
                                  DateTime.parse(prefs!.getString("Date") ?? ""));
                              second = 30 - diff.inSeconds;

                              showDialog(
                                context: context,
                                builder: (context) {
                                  return (diff.inSeconds > 30)
                                      ? AlertDialog(
                                    title: Text(
                                      "Skip",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    buttonPadding: EdgeInsets.only(left: 30),
                                    content: Text(
                                        "Are you sure you want to skip this level ?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style:
                                            TextStyle(color: Colors.pink),
                                          )),
                                      TextButton(
                                          onPressed: () async {
                                            SharedPreferences pref =
                                            await SharedPreferences
                                                .getInstance();

                                            DateTime t1 = DateTime.now();
                                            pref.setString(
                                                "Date", t1.toString());
                                            current_level++;
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return page_1_conu(current_level);
                                                  },
                                                ));
                                            setState(() {});
                                          },
                                          child: Text(
                                            "Ok",
                                            style:
                                            TextStyle(color: Colors.pink),
                                          )),
                                    ],
                                  )
                                      : AlertDialog(
                                    title: Text("Wait"),
                                    content:
                                    Text("Wait For ${second} Second"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Ok"))
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Skip",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    buttonPadding: EdgeInsets.only(left: 30),
                                    content: Text(
                                        "Are you sure you want to skip this level?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(color: Colors.pink),
                                          )),
                                      TextButton(
                                          onPressed: () async {
                                            DateTime t1 = DateTime.now();
                                            prefs!.setString("Date", t1.toString());
                                            current_level++;
                                            prefs!.setInt("Time", 1);
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return page_1_conu(current_level);
                                                  },
                                                ));
                                            setState(() {});
                                          },
                                          child: Text(
                                            "Ok",
                                            style: TextStyle(color: Colors.pink),
                                          )),
                                    ],
                                  );
                                },
                              );
                            }


                         /* prefs!.setString("puzzle_status${current_level}", "skip");


                          if(current_level<data.ans.length-1)
                            {
                              prefs!.setInt("cur_level", current_level);
                              current_level++;
                            }*/
                          setState(() {});

                        },
                        child: Container(
                          child: Flex(direction: Axis.vertical),
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(right: 50),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/skip.png"))),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Center(
                            child: Text(
                          "Puzzle ${current_level + 1} ",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "f1",
                              fontWeight: FontWeight.bold),
                        )),
                        height: 75,
                        width: 300,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/level_board.png"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 50),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/hint.png"))),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                            height: 400,
                            width: 400,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/page_1_conu/${data.game_page_1_images[current_level]}")))))
                  ],
                ),
                Spacer(),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          color: Colors.black,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 250,
                                      alignment: Alignment.centerLeft,
                                      child: Text("${ans}",style: TextStyle(fontWeight: FontWeight.bold),),
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (ans.length > 0) {
                                              String del = ans.substring(
                                                  0, ans.length - 1);
                                              ans = del;
                                              setState(() {});
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 75,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "images/delete.png"))),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: InkWell(
                                          onTap: () {
                                            if (ans == data.ans[current_level]) {
                                              prefs!.setString("puzzle_status${current_level}", "win");
                                              if(current_level<data.ans.length-1)
                                                {
                                                  current_level++;
                                                  int t =prefs!.getInt("cur_level")??0;
                                                  if(current_level>t)
                                                    {
                                                      prefs!.setInt("cur_level", current_level);
                                                    }

                                                }

                                              ans = "";
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return win_page(
                                                      current_level);
                                                },
                                              ));
                                              setState(() {});
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "Wrong Answer",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 2,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            }
                                            setState(() {});
                                          },
                                          child: Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Text(
                                                "SUBMIT",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.black38),
                                            ),
                                            onPressed: () {
                                              ans += "1";
                                              setState(() {});
                                            },
                                            child: Text(
                                              "1",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.black38)),
                                            onPressed: () {
                                              ans += "2";
                                              setState(() {});
                                            },
                                            child: Text(
                                              "2",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.black38)),
                                            onPressed: () {
                                              ans += "3";
                                              print("${ans}");
                                              setState(() {});
                                            },
                                            child: Text(
                                              "3",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.black38)),
                                            onPressed: () {
                                              ans += "4";
                                              setState(() {});
                                            },
                                            child: Text(
                                              "4",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.black38)),
                                            onPressed: () {
                                              ans += "5";
                                              setState(() {});
                                            },
                                            child: Text(
                                              "5",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.black38)),
                                            onPressed: () {
                                              ans += "6";
                                              setState(() {});
                                            },
                                            child: Text(
                                              "6",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.black38)),
                                            onPressed: () {
                                              ans += "7";
                                              setState(() {});
                                            },
                                            child: Text(
                                              "7",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.black38)),
                                            onPressed: () {
                                              ans += "8";
                                              setState(() {});
                                            },
                                            child: Text(
                                              "8",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.black38)),
                                            onPressed: () {
                                              ans += "9";
                                              setState(() {});
                                            },
                                            child: Text(
                                              "9",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.black38)),
                                            onPressed: () {
                                              ans += "0";
                                              setState(() {});
                                            },
                                            child: Text(
                                              "0",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1))),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Are you sure you want to exit ?"),
              actions: [
                TextButton(onPressed: () {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return pazzal_game();
                  },));
                }, child: Text("Yes")),
                TextButton(onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return page_1_conu(current_level);
                  },));
                }, child: Text("No"))
              ],
            );
          },
        );
        return true;
      },
    ));
  }
}
