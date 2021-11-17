import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_chat/widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

// para sincronizar las animaciones -->  with TickerProviderStateMixin
class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> _messages = [];

  bool _estaescribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            CircleAvatar(
              child: Text(
                'Te',
                style: TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            SizedBox(height: 3),
            Text(
              'Jimmy Muñoz',
              style: TextStyle(color: Colors.black, fontSize: 10),
            )
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                reverse: true, // coloca alreves la recarga del chat
              ),
            ),
            Divider(height: 1),
            //TODO: Caja de texto
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
              child: TextField(
            controller: _textController,
            onSubmitted: _handlesSubmit,
            onChanged: (String texto) {
              setState(() {
                //configuración que determina si está escribiendo
                if (texto.trim().length > 0) {
                  _estaescribiendo = true;
                } else {
                  _estaescribiendo = false;
                }
              });
            },
            decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
            focusNode: _focusNode,
          )),

          //Botón de enviar
          Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: Text('Enviar'),
                      onPressed: _estaescribiendo
                          ? () => _handlesSubmit(_textController.text.trim())
                          : null,
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      //Botón de envió de mensaje
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                          highlightColor: Colors
                              .transparent, // configuración transparente de presión del botón
                          splashColor: Colors
                              .transparent, // configuración transparente de presión del botón
                          icon: Icon(
                            Icons.send,
                          ),
                          onPressed: _estaescribiendo
                              ? () =>
                                  _handlesSubmit(_textController.text.trim())
                              : null,
                        ),
                      ),
                    ))
        ],
      ),
    ));
  }

  //Comportamiento de la caja de texto de envió de mensajes.
  _handlesSubmit(String texto) {
    if (texto.length == 0) return;
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChatMessage(
        uid: '123',
        texto: texto,
        animationController: AnimationController(
            vsync: this, duration: Duration(milliseconds: 200)));
    _messages.insert(0, newMessage);
    newMessage.animationController.forward(); // iniciar la animación
    setState(() {
      _estaescribiendo = false;
    });
  }

  @override
  void dispose() {
    //TODO: Off del socket

// limpia animationController cuando se cierra los mensajes
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
