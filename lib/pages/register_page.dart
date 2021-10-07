import 'package:flutter/material.dart';

import 'package:flutter_chat/widgets/custom_input.dart';
import 'package:flutter_chat/widgets/custom_label.dart';
import 'package:flutter_chat/widgets/custom_logo.dart';
import 'package:flutter_chat/widgets/button_blue.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        // SafeArea para dar un espacio en parte de arriba
        child: SingleChildScrollView(
          //SingleChildScrollView crear el scroll es un widget\
          physics:
              BouncingScrollPhysics(), // physics: BouncingScrollPhysics() -- crear un revote cuando se hace el scroll
          child: Container(
            height: MediaQuery.of(context).size.height *
                0.9, // toma toda la pantalla y se múltiplica por el 90% de la pantalla
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomLogo(
                  titulo: 'Registro',
                ),
                _Form(),
                CustomLabel(
                  ruta: 'login',
                  tituloLabel: '¿Ya tienes una cuenta?',
                  btnLabel: 'Ingresar ahora!',
                ),
                Text(
                  'Terminos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.name,
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          ButtonBlue(
              text: 'Ingresar',
              onPressed: () {
                print(emailCtrl.text);
                print(passCtrl.text);
              }),
        ],
      ),
    );
  }
}
