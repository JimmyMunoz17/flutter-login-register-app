import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput(
      {Key key,
      @required this.icon,
      @required this.placeholder,
      @required this.textController,
      this.keyboardType = TextInputType.text,
      this.isPassword = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //Decoraciones de la caja de texto "Textfield"
      padding: EdgeInsets.only(top: 5, left: 5, right: 20, bottom: 5),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.05), //color
              offset: Offset(0, 5), //sobra
              blurRadius: 5 // radio de curvatura
              )
        ],
      ),
      child: TextField(
        controller: this.textController,
        autocorrect: false, //autocorrector
        keyboardType: this.keyboardType, // tipo de input
        obscureText: this.isPassword, // ocultar el texto
        decoration: InputDecoration(
            prefixIcon: Icon(this.icon), // icono
            focusedBorder: InputBorder.none, // quitar borde inferior
            border: InputBorder
                .none, // quitar borde inferior cuando no esta seleccionado
            hintText: this.placeholder // nombre que aparece en el textfield
            ),
      ),
    );
  }
}
