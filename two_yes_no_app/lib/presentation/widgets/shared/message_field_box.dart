import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  // Propiedad para emitir el valor que la caja de texto tiene
  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key,
    required this.onValue
  });

  @override
  Widget build(BuildContext context) {

    // Elemento que nos da control al input que lo asociemos
    final textController = TextEditingController();

    // Cuando un elemento necesita un foco
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent
      ),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "??"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon( Icons.send_outlined ),
          onPressed: () {
            // Obtener el texto al oprimir boton de enviar 
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          },
        ),
      );

    return TextFormField(
      // Para manejar si es correo electrónico o algo así
      // keyboardType: ,

      // Realizar al accion al hacer click fuera
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      //Obtener el valor del campo.
      onFieldSubmitted: (value) {
        // Limpia la caja de texto al enviar
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
      // Obtener cada que cambie
      // onChanged: ,
    );
  }
}