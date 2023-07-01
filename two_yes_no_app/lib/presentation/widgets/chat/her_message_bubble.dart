import 'package:flutter/material.dart';
import 'package:two_yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {

  final Message message;

  const HerMessageBubble({
    super.key, 
    required this.message,
  });
  
  @override
  Widget build(BuildContext context) {
    // Busca el tema dentro del contexto, el primero que encuentres, usalo
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
            ),
            child: Text(
              message.text,
              style: const TextStyle(
                color: Colors.white
              ),
              ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),

        //Todo: imagen
        _ImageBubble(
          message.imageUrl.toString()
        ),

        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String imageUrl;

  const _ImageBubble(
    this.imageUrl
  );

  @override
  Widget build(BuildContext context) {

    // Saber la medida del dispositivo
    final size = MediaQuery.of(context).size;

    // Permite crear contenedores para imágenes
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,

        // Realizar una función mientras carga
        loadingBuilder: (context, child, loadingProgress) {

          // El child es la imagen ya construida 
          if ( loadingProgress == null ) return child;
          
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: const Text('Se está enviando imagen')
          );
        },
      )
    );
  }
}