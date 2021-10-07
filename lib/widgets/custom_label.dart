import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String ruta;
  final String tituloLabel;
  final String btnLabel;

  const CustomLabel(
      {Key key,
      @required this.ruta,
      @required this.tituloLabel,
      @required this.btnLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            this.tituloLabel,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 10),
          GestureDetector(
            //GestureDetector permite colocar cualquier gesto que necesitemos ej: OnTap()
            child: Text(
              this.btnLabel,
              style: TextStyle(
                  color: Colors.blue[200],
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              //print('Tap');
              // Navigator.pushReplacementNamed(context, ruta) llamar otra ventana o pages
              Navigator.pushReplacementNamed(context, this.ruta);
            },
          ),
        ],
      ),
    );
  }
}
