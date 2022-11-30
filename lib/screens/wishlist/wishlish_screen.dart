import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecom/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_ecom/models/models.dart';
import 'package:flutter_ecom/widgets/widget.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFD9D8D7),
        appBar: CustomAppBar(title: 'Wishlist'),
        bottomNavigationBar: CustomNavBar(screen: routeName),
        body: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
            if (state is WishlistLoaded) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.015,
                ),
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.015,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2,
                  ),
                  itemCount: state.wishlist.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: ProductCard.wishlist(
                        product: state.wishlist.products[index],
                      ),
                    );
                  },
                ),
              );
            }
            return Text('Something went wrong!');
          },
        ));
  }
}
