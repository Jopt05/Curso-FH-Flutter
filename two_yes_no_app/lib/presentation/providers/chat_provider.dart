import 'package:flutter/material.dart';
import 'package:two_yes_no_app/domain/entities/message.dart';
import 'package:two_yes_no_app/helpers/get_yes_no_answer.dart';


// Un ChangeNotifier puede notificar cuando existen cambios
// y podremos renderizar cosas
class ChatProvider extends ChangeNotifier {

  // Para poder scrollear hasta abajo
  final ScrollController chatScrollController = ScrollController();

  // Helper para mensajes de ella 
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
  ];

  Future<void> sendMessage( String text ) async {

    if ( text.isEmpty ) return;
    // Añadir nuevo mensaje mio
    final newMessage = Message(
      text: text, 
      fromWho: FromWho.mine
    );

    messageList.add(
      newMessage
    );

    if ( text.endsWith('?') ) {
      herReply();
    }

    // Actualiza el provider, notifica a todos los eque escuchen
    notifyListeners();
    moveScrollToBottom();
  }

  // Como hacer un scroll
  void moveScrollToBottom() {

    chatScrollController.animateTo(
      // Ve hasta el máximo que puedas 
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration( milliseconds: 300 ), 
      curve: Curves.easeOut
    );

  }

  // Metodo para agregar mensajes de ella
  Future<void> herReply() async {

    final herMessage = await getYesNoAnswer.getAnswer();

    messageList.add(
      herMessage
    );
    notifyListeners();
    moveScrollToBottom();

  }

}