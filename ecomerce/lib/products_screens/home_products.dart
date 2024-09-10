import 'package:ecomerce/models/product.dart';
import 'package:ecomerce/my_flutter_app_icons.dart';
import 'package:ecomerce/products_screens/detail_product.dart';
import 'package:ecomerce/profile_screens/profile.dart';
import 'package:ecomerce/provider/categoria_provider.dart';
import 'package:ecomerce/services/services_product.dart';
import 'package:ecomerce/shopping_cart_screens/shopping_cart.dart';
import 'package:ecomerce/widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProducts extends StatefulWidget {
  const HomeProducts({super.key});

  @override
  _HomeProductsState createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> with TickerProviderStateMixin {
  late TabController _tabController;
  List<Product> products = [];
  List<Product> productsCategory = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 0);

    Future.delayed(Duration.zero, () async {
      await callCategories();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> callCategories() async {
    AppProvider notifier = Provider.of<AppProvider>(context, listen: false);
    await notifier.fetchCategories();
    await fetchProducts();

    _tabController = TabController(vsync: this, length: notifier.categories.length);

    _tabController.addListener(_handleTabChange);

    setState(() {});
  }

  void _handleTabChange() {
    setState(() {
      productsCategory = products.where((element) => element.category.id == _tabController.index + 1).toList();
    });
  }


  Future<void> fetchProducts() async {
    products = await ProductService().getProducts();
    productsCategory = products.where((element) => element.category.id == _tabController.index + 1).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<AppProvider>(context).categories.isNotEmpty
          ? Consumer<AppProvider>(
        builder: (context, notifier, _) {
          if (_tabController.length != notifier.categories.length) {
            _tabController = TabController(vsync: this, length: notifier.categories.length);
            _tabController.addListener(_handleTabChange);
          }

          productsCategory = products.where((element) => element.category.id == _tabController.index + 1).toList();

          return buildCustomScrollView(context);
        },
      )
          : const SizedBox(height: 0),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.shopping_cart, color: Theme.of(context).colorScheme.onPrimary),
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ShoppingCartScreen()));
        },
      ),
    );
  }

  CustomScrollView buildCustomScrollView(BuildContext context) {
    AppProvider notifier = Provider.of<AppProvider>(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Amuletos de la suerte'),
          pinned: false,
          floating: true,
          snap: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
              icon: Icon(Icons.person),
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: notifier.categories.map((e) => Tab(
                icon: buildIcon(e.name),
                text: e.name)).toList(),
            tabAlignment: TabAlignment.start,
          ),
        ),
        _buildProductGrid(context, productsCategory),
      ],
    );
  }

  buildIcon(String categoryId){
    Icon icon= Icon(MyIcons.vietnam);

    switch (categoryId){
      case 'India':
        icon = Icon(MyIcons.india);
        break;
      case 'China':
        icon= Icon(MyIcons.chinese);
        break;
      case 'Tailandia':
        icon = Icon(MyIcons.thailand);
        break;
      case 'Japón':
        icon= Icon(MyIcons.japan);
        break;
      case 'Vietnam':
        icon= Icon(MyIcons.vietnam);
    }
    return icon;
  }

  Widget _buildProductGrid(BuildContext context, List<Product> products) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
        childAspectRatio: 0.7,
      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailProduct(product: products[index]),
                ),
              );
            },
            child: CardProduct(product: products[index]),
          );
        },
        childCount: productsCategory.length,
      ),
    );
  }
}
