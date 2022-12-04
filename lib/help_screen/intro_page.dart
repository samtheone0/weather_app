
import 'dart:async';

import 'package:app/homescreen/homescreen.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({ Key key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}
class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5),
            ()=>
    Navigator.push(context, MaterialPageRoute(builder:
        (context) =>
    home()
    )));

    return Material(
      child: Center(
        child: Container(

          decoration: BoxDecoration(
              color: Colors.grey[100],
              image: const DecorationImage(image: AssetImage('assets/moru.png'),
                  fit: BoxFit.cover
              )
          ),
          child:Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 31),
                      child: Text(
                        'We Show Weather Here',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize:32),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/weather.jpg',
                        height: 500,
                        width: 350,),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 10.0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              child: const Text(
                                'SKIP',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                 MaterialPageRoute(
                                 builder: (context) => home()));},

                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
        ),
      ));
  }
}
