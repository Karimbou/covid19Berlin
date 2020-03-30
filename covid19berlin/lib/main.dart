import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:latlong/latlong.dart';
import 'package:responsive_container/responsive_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('covid19Berlin')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTitleSection(),
            _buildTableSection(),
            _buildMapSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.purpleAccent[500],
          ),
          Text('Infizierte gesamt'),
        ],
      ),
    );
  }

  Widget _buildTableSection() {
    return Container(
      child: Table(
        border: TableBorder.all(color: Colors.black26, width: 1, style: BorderStyle.none),
        children: [
          TableRow(children: [
            TableCell(child: Center(child: Text('Fall'))),
            TableCell(
                child: Center(
                  child: Text('Zahlen'),
                )),
          ]),
          TableRow(children: [
            TableCell(
                child: Center(
                  child: Text('Date 1'),
                )),
            TableCell(
                child: Center(
                  child: Text('Date 1.b'),
                )),
          ]),
          TableRow(children: [
            TableCell(
                child: Center(
                  child: Text('Date 2'),
                )),
            TableCell(
                child: Center(
                  child: Text('Date 2.b'),
                )),
          ]),
          TableRow(children: [
            TableCell(
                child: Center(
                  child: Text('Date 3'),
                )),
            TableCell(
                child: Center(
                  child: Text('Date 3.b'),
                )),
          ]),
          TableRow(children: [
            TableCell(
                child: Center(
                  child: Text('Date 4'),
                )),
            TableCell(
                child: Center(
                  child: Text('Date 4.b'),
                )),
          ]),
          TableRow(children: [
            TableCell(
                child: Center(
                  child: Text('Date 5'),
                )),
            TableCell(
                child: Center(
                  child: Text('Date 5.b'),
                )),
          ]),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return ResponsiveContainer(
      heightPercent: 80.0,
      widthPercent: 100.0,
      padding: const EdgeInsets.all(8),
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(52.520008, 13.404954),
          zoom: 9.0,
          plugins: [EsriPlugin()],
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
            subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
            tileProvider: CachedNetworkTileProvider(),
          ),
          FeatureLayerOptions(
            url:
            "https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/RKI_Landkreisdaten/FeatureServer/0",
            geometryType: "polygon",
            onTap: (attributes, LatLng location) {
              print(attributes);
            },
            render: (dynamic attributes) {
              // You can render by attribute
              return PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 2,
              );
            },
          ),
          FeatureLayerOptions(
            url:
            "https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/Krankenhaus_hospital/FeatureServer/0",
            geometryType: "point",
            render: (dynamic attributes) {
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
    );
  }
}