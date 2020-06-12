import 'package:flutter/material.dart';


void main() {
  //print(await getData());

  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.green,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          hintStyle: TextStyle(color: Colors.green),
        )),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Controladores para os textfields
  final microLiterController = TextEditingController();
  final miliLiterController = TextEditingController();
  final literController = TextEditingController();

  double uL;
  double mL;
  double liter;


  void _microLiterChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double uL = double.parse(text);
    miliLiterController.text = (uL / 1000).toString();
    literController.text = (uL / 1000000).toString();
  }

  void _miliLiterChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double mL = double.parse(text);
    microLiterController.text = (mL * 1000).toString();
    literController.text = (mL / 1000).toString();

  }

  void _literChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double liter = double.parse(text);
    microLiterController.text = (liter * 1000000).toString();
    miliLiterController.text = (liter * 1000).toString();
  }

  //função para apagar todos os campos
  void _clearAll() {
    miliLiterController.text = "";
    microLiterController.text = "";
    literController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
            "Conversor de Unidades"), //Usamos a barra normal "\" para que o dart interprete os símbolos como letras.
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              "icon/icone.png",
              fit: BoxFit.contain,
              height: 200.0,
              width: 200.0,
            ),
            Divider(),
            buildTextField("Microlitros", "uL ", microLiterController, _microLiterChanged),
            Divider(),
            buildTextField("Mililitros", "mL ", miliLiterController, _miliLiterChanged),
            Divider(),
            buildTextField("Litros", "L ", literController, _literChanged),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 100.0, bottom: 20.0),
              child: Text(
                "By Francisco Junior",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(
    String label, String prefix, TextEditingController control, Function func) {
  return TextField(
    controller: control,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.green),
        border: OutlineInputBorder(),
        prefixText: prefix),
    style: TextStyle(color: Colors.green, fontSize: 25.0),
    onChanged: func,
    keyboardType: TextInputType.number,
  );
}
