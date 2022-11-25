import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecom/blocs/category/category_bloc.dart';
import 'package:flutter_ecom/blocs/product/product_bloc.dart';
import 'package:flutter_ecom/widgets/widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'BM Shopping',
        ),
        bottomNavigationBar: CustomNavBar(screen: routeName),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CategoryLoaded) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1.5,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: state.categories
                          .map((category) => CarouselCard(category: category))
                          .toList(),
                    );
                  } else {
                    return Text('Something went wrong.');
                  }
                },
              ),
              SectionTitle(title: 'Recommended'),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ProductLoaded) {
                    return ProductCarousel(
                      products: state.products
                          .where((product) => product.isRecommended)
                          .toList(),
                    );
                  } else {
                    return Text('Something went wrong.');
                  }
                },
              ),
              SectionTitle(title: 'Most popular'),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ProductLoaded) {
                    return ProductCarousel(
                      products: state.products
                          .where((product) => product.isPopular)
                          .toList(),
                    );
                  } else {
                    return Text('Something went wrong.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
