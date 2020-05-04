import 'package:cryptoapp/details.dart';
//import 'package:cryptoapp/main.dart';
import 'package:flutter/material.dart';

const green = 0xFF1DB954;
const black = 0xFF191414;

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    Data more = ModalRoute.of(context).settings.arguments;

    int oneS = 0;
    var one = double.parse(more.percentChange1h);

    if (one < 0) {
      oneS = 1;
    }

    int twS = 0;
    var tw = double.parse(more.percentChange24h);

    if (tw < 0) {
      twS = 1;
    }

    int sdS = 0;
    var sd = double.parse(more.percentChange7d);

    if (sd < 0) {
      sdS = 1;
    }

    return Scaffold(
      backgroundColor: Color(black),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(black),
        centerTitle: true,
        title: Text(more.name),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 320,
          child: Card(
            elevation: 20,
            color: Colors.black38,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  more.symbol,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.yellowAccent,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Price in Bitcoin',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Chip(
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            backgroundColor: Colors.amberAccent,
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  more.priceBtc,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'BTC',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Price in USD',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Chip(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            backgroundColor: Colors.amberAccent,
                            label: Text('\$ ${more.priceUsd}'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'Percentage Change in One Hour',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Chip(
                    backgroundColor:
                        oneS == 1 ? Colors.redAccent : Colors.green,
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    label: Text(
                      '${more.percentChange1h}%',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Text(
                  'Percentage Change in 24 Hour',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
                Chip(
                  backgroundColor: twS == 1 ? Colors.redAccent : Colors.green,
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  label: Text('${more.percentChange24h}%'),
                ),
                Text(
                  'Percentage Change in 7 Days',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
                Chip(
                  backgroundColor: sdS == 1 ? Colors.redAccent : Colors.green,
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  label: Text('${more.percentChange7d}%'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
