import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_yes_no_app/domain/entities/message.dart';
import 'package:two_yes_no_app/presentation/providers/chat_provider.dart';
import 'package:two_yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:two_yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:two_yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/128/1785/1785911.png'),
          ),
        ),
        title: const Text('Conversación'),
        centerTitle: true,
      ),
      // El container actúa como un div
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Referencia al provider
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        // Podemos colocar específicamente paddings con symetric
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // El expander permite expandir un widget a todo el espacio disponible
            Expanded(
              child: ListView.builder(
                // Para poder scrollear
                controller: chatProvider.chatScrollController,
                
                // Obtenemos la longitud del chatprovider
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  // Colocamos una condicional
                  final message = chatProvider.messageList[index];
                  
                  return ( message.fromWho == FromWho.hers )
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
                },
              )
            ),
            // Caja de texto de mensajes
            MessageFieldBox(
              // Value es el valor que retorna la función elaborada dentro del widget
              onValue: (value) {
                chatProvider.sendMessage(
                  value
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}