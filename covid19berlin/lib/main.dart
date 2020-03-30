import 'package:flutter/material.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Covid-19 / Berlin',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Fallzahlen Infizierte in Berlin',
                  style: TextStyle(color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.star,
          color: Colors.purpleAccent[500],
          ),
          Text('Infizierte gesamt'),
        ],
      ),
    );
    
    Widget tableSection = Container(
  padding: const EdgeInsets.all(32),
  child: Table(
    border: TableBorder.all(
      color: Colors.black26, width: 1, style: BorderStyle.none),
      children: [
      TableRow(children: [
        TableCell(child: Center(child: Text('Fall'))),
        TableCell(child: Center(child: Text('Zahlen'),)),
      ]),
      TableRow(children: [
        TableCell(child: Center(child: Text('Date 1'),)),
        TableCell(child: Center(child: Text('Date 1.b'),)),
      ]),
      TableRow(children: [
        TableCell(child: Center(child: Text('Date 2'),)),
        TableCell(child: Center(child: Text('Date 2.b'),)),
      ]),
      TableRow(children: [
        TableCell(child: Center(child: Text('Date 3'),)),
        TableCell(child: Center(child: Text('Date 3.b'),)),
      ]),
      TableRow(children: [
        TableCell(child: Center(child: Text('Date 4'),)),
        TableCell(child: Center(child: Text('Date 4.b'),)),
      ]),
    TableRow(children: [
        TableCell(child: Center(child: Text('Date 5'),)),
        TableCell(child: Center(child: Text('Date 5.b'),)),
      ]),
  ],
  ),
);

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Covid-19 / Berlin',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
                Text(
                  'Fallzahlen Infizierte in Berlin',
                  style: TextStyle(color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.star,
          color: Colors.purpleAccent[500],
          ),
          Text('Infizierte gesamt'),
        ],
      ),
    );

    Widget tableSection = Container(
    child: Table(
      border: TableBorder.all(
        color: Colors.black26, width: 1, style: BorderStyle.none),
        children: [
        TableRow(children: [
          TableCell(child: Center(child: Text('Fall'))),
          TableCell(child: Center(child: Text('Zahlen'),)),
      ]),
      TableRow(children: [
        TableCell(child: Center(child: Text('Date 1'),)),
        TableCell(child: Center(child: Text('Date 1.b'),)),
      ]),
      TableRow(children: [
        TableCell(child: Center(child: Text('Date 2'),)),
        TableCell(child: Center(child: Text('Date 2.b'),)),
      ]),
      TableRow(children: [
        TableCell(child: Center(child: Text('Date 3'),)),
        TableCell(child: Center(child: Text('Date 3.b'),)),
      ]),
      TableRow(children: [
        TableCell(child: Center(child: Text('Date 4'),)),
        TableCell(child: Center(child: Text('Date 4.b'),)),
      ]),
    TableRow(children: [
        TableCell(child: Center(child: Text('Date 5'),)),
        TableCell(child: Center(child: Text('Date 5.b'),)),
      ]),
  ],
  ),
);

Widget mapSection = Container(
padding: const EdgeInsets.all(8),
child: Column(
        children: [
              Container(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(52.520008, 13.404954),
                    zoom: 9.0,
                    plugins: [EsriPlugin()],
                  ),

                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                      'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                      subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                      tileProvider: CachedNetworkTileProvider(),
                    ),
                    FeatureLayerOptions(
                      url: "https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/RKI_Landkreisdaten/FeatureServer/0",
                      geometryType:"polygon",
                      onTap: (attributes, LatLng location) {
                        print(attributes);
                      },
                      render: (dynamic attributes){
                        // You can render by attribute
                        return PolygonOptions(
                            borderColor: Colors.blueAccent,
                            color: Colors.black12,
                            borderStrokeWidth: 2,
                        );
                      },
                    ),

                    FeatureLayerOptions(
                      url: "https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/Krankenhaus_hospital/FeatureServer/0",
                      geometryType:"point",
                      render:(dynamic attributes){
                        // You can render by attribute
                        return Marker(
                          width: 30.0,
                          height: 30.0,
                          builder: (ctx) => Icon(Icons.pin_drop, color: Colors.black38),
                        );
                      },
                      onTap: (attributes, LatLng location) {
                        print(attributes);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
);

    return MaterialApp(
      title: 'Covid19Berlin',
      home: Scaffold(
        appBar: AppBar(title: Text('covid19Berlin')),
        body: ListView(
          children: [
            titleSection,
            tableSection,
            mapSection,
          ],
        ),
      ),
    );
  }
}
