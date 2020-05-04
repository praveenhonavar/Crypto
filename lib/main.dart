import 'dart:convert';
//import 'dart:html';

import 'package:cryptoapp/details.dart';
import 'package:cryptoapp/more.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

const green = 0xFF1DB954;
const black = 0xFF191414;

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: HomePage(),
        title: 'Crypto',
        debugShowCheckedModeBanner: false,
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = 'https://api.coinlore.net/api/tickers';


  Cryptodetail cryptoDetail;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await get(url);
    var detail = jsonDecode(res.body);
    //var onlyData=detail['data'];

    //print(onlyData[1]['name']);
    cryptoDetail = Cryptodetail.fromJson(detail);

    print(cryptoDetail.toJson());
    //print(cryptoDetail.toJson().length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Color(black),
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:15.0),
            child: Icon(
              Icons.search,
            ),
          ),
        ],
        backgroundColor: Color(black),
        centerTitle: true,
        title: Text(
          'Crypto',
        ),
      ),
      body: cryptoDetail == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView.builder(
                itemCount: 100,
                shrinkWrap: true,
                itemBuilder: (context, index) {

                  Data coin = cryptoDetail.data[index];
                  int status = 0;
                  
                  var a = double.parse(coin.percentChange24h);
                  if (a < 0) {
                    status = 1;
                  }

                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => More(),
                          settings: RouteSettings(
                            arguments: coin,
                            
                          ),
                        ),
                      );
                    },
                    subtitle: Text(
                      '\$ ' '${coin.priceUsd}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: status == 1
                        ? Text(
                            coin.percentChange24h,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )
                        : Text(
                            '+${coin.percentChange24h}',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                    leading: CircleAvatar(
                      radius: 28,
                      child: Text(
                        coin.symbol,
                      ),
                      backgroundColor: Color(black),
                    ),
                    title: Text(
                      coin.name,
                      style: TextStyle(
                        color: Colors.yellowAccent,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  );
                },
              ),
            ),
    );
  }
}
