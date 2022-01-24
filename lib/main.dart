import 'package:flutter/material.dart';
import 'package:link_tree_proj/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawerEnableOpenDragGesture: false,
          body: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
            child: Column(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15)),
                          child: Image.asset(
                            'images/yassin.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'looking for a job',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Text(name),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Text(bio),
                    ),
                    Text(location),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: map.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: GestureDetector(
                                onTap: () async {
                                  await _launchURL(map.values.elementAt(i));
                                },
                                child: Text(
                                  '${map.keys.elementAt(i)} :\n ${map.values.elementAt(i)}',
                                  overflow: TextOverflow.fade,
                                ),
                              )),
                        );
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: Center(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mapContact.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: GestureDetector(
                                    onTap: () async {
                                      await _launchURLcontact(
                                          map.values.elementAt(i));
                                    },
                                    child: CircleAvatar(
                                      child:
                                          FaIcon(mapContact.keys.elementAt(i)),
                                    ))),
                          );
                        }),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Future<void> _launchURL(_url) async {
    if (await launch(_url)) throw 'Could not launch $_url';
  }

  Future<void> _launchURLcontact(_url) async {
    if (await launch('https://wa.me/$_url/')) throw 'Could not launch $_url';
  }
}
