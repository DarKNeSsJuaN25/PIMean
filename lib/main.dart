import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner; // Importa el archivo donde se encuentra la pantalla de escaneo de QR

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  String qrvalue = "Codigo QR";

  void scanQR() async{
    String? cameraScanResult = await scanner.scan();
    if(cameraScanResult != null)
    {
      setState(() {
        qrvalue = cameraScanResult;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Presupuesto almacenado',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: Center(
            child: Text(
              "Presupuesto",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Center(
          child: Text(
            qrvalue,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () =>scanQR(),
          child: Icon(
            Icons.camera,
          ),
        ),
      ),
    );
  }
}