import 'package:flutter/material.dart';
import 'package:lorem_gen/lorem_gen.dart';


class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = true;
  final paragraph = Lorem.paragraph();
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  List<String> listOptions = <String>['1', '2','3'];
  //sempre tots els noms de variables en anglès


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _isScrolled = _scrollController.hasClients &&
          _scrollController.offset > (kToolbarHeight + 20);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              // BackButton
              leading: BackButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                color: _isScrolled ? Colors.black : Colors.white,),
             /* IconButton(onPressed: (){
                Navigator.of(context).pop();
              },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: _isScrolled ? Colors.black : Colors.white,),
              ),*/
              title: Padding(
                padding: const EdgeInsetsDirectional.only( top: 0, end: 100),
                child: Text('Pack Personalizado', style: TextStyle(
                    color: _isScrolled ? Colors.black : Colors.transparent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
              ),
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 150,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode:CollapseMode.parallax,
                titlePadding: const EdgeInsetsDirectional.only(start: 0, bottom: 5, top: 0, end: 150),
                title: _isScrolled? null: (const Text(
                    'Pack Personalizado',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        ))
                    ),
                background: Image.asset(
                  'assets/cesta.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children:[
                        Text("\nGenerating a random paragraph:\n\n$paragraph", style: const TextStyle(color: Colors.black45),),
                        const TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Nombre pack',
                          )
                        ),
                        const SizedBox(height: 20,),
                        const Text('Cantidad:'),
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                          ),
                          items: listOptions.map((e){
                            return DropdownMenuItem(
                              child: Text(e),
                                  value: e
                            );
                          }).toList(),
                          isDense: true,
                          isExpanded: true,
                          onChanged: (value) {}
                        )
                      ]
                    ),
                  );
                })
            )
            
          ],

        ),
        floatingActionButton:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(350, 50),
            ),
            onPressed: () {},
            child: const Text('Total', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
