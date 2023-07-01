
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [
    1,
    2,
    3,
    4,
    5
  ];

  final ScrollController scrollControler = ScrollController();
  bool isLoading = false;
  bool isMounted = true;
  
  @override
  // Creado para escuchar el scroll controller 
  void initState() {
    super.initState();

    scrollControler.addListener(() {
      
      // Como saber si estoy al final 
      if ( (scrollControler.position.pixels + 500) >= scrollControler.position.maxScrollExtent ) {

        loadNextPage();

      }

    });

  }

  @override
  void dispose() {
    scrollControler.dispose();
    isMounted = false;
    super.dispose();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );

    setState(() {
      
    });
  }

  Future loadNextPage() async{

    if ( isLoading ) return;
    isLoading = true;
    setState(() {
      
    });

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    if ( !isMounted ) return;

    setState(() {
      
    });

    moveScrollToBottom();

  }

  // Función para simular un refresh
  Future<void> onRefresh() async{

    await Future.delayed(const Duration(seconds: 3));
    if ( !isMounted ) return;

    final lastId = imagesIds.last;
    isLoading = true;
    // Borro los elementos del listado
    imagesIds.clear();

    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {
      
    });

  }

  void moveScrollToBottom() {

    // Si estoy ya al final, no hagas nada
    if ( scrollControler.position.pixels + 150 <= scrollControler.position.maxScrollExtent ) return;

    scrollControler.animateTo(
      scrollControler.position.pixels + 120,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 300),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Permite remover el espacio en la parte de arriba, en caso de que queramos
      // usar toda la pantalla
      body: MediaQuery.removePadding(
        removeBottom: true,
        removeTop: true,
        context: context,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          // Metodo que ejecuta el trabajo
          // Esto es un future
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollControler,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const NetworkImage('https://i.gifer.com/ZKZg.gif'),
                image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/500/300'),
              );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
        ? SpinPerfect(
          infinite: true,
          child: const Icon( Icons.refresh_rounded ),
        )
        : FadeIn(child: const Icon( Icons.arrow_back_ios )),
      ),
    );
  }
}