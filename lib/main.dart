import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecom/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecom/blocs/category/category_bloc.dart';
import 'package:flutter_ecom/blocs/checkout/checkout_bloc.dart';
import 'package:flutter_ecom/blocs/payment/payment_bloc.dart';
import 'package:flutter_ecom/blocs/product/product_bloc.dart';
import 'package:flutter_ecom/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_ecom/config/app_route.dart';
import 'package:flutter_ecom/config/theme.dart';
import 'package:flutter_ecom/models/models.dart';
import 'package:flutter_ecom/repository/auth/auth_repository.dart';
import 'package:flutter_ecom/repository/category/category_repository.dart';
import 'package:flutter_ecom/repository/checkout/checkout_repository.dart';
import 'package:flutter_ecom/repository/local_storage/local_storage_repository.dart';
import 'package:flutter_ecom/repository/product/product_repository.dart';
import 'package:flutter_ecom/repository/user/user_repository.dart';
import 'package:flutter_ecom/screens/screens.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BM Shopping',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => AuthRepository(),
          ),
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => WishlistBloc(
                localStorageRepository: LocalStorageRepository(),
              )..add(
                  StartWishlist(),
                ),
            ),
            BlocProvider(
              create: (_) => CartBloc()
                ..add(
                  LoadCart(),
                ),
            ),
            BlocProvider(
              create: (_) => PaymentBloc()
                ..add(
                  LoadPaymentMethod(),
                ),
            ),
            BlocProvider(
              create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                paymentBloc: context.read<PaymentBloc>(),
                checkoutRepository: CheckoutRepository(),
              ),
            ),
            BlocProvider(
              create: (_) => CategoryBloc(
                categoryRepository: CategoryRepository(),
              )..add(LoadCategories()),
            ),
            BlocProvider(
              create: (_) => ProductBloc(
                productRepository: ProductRepository(),
              )..add(
                  LoadProducts(),
                ),
            ),
          ],
          child: MaterialApp(
            title: 'BM Shopping',
            debugShowCheckedModeBanner: false,
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: SplashScreen.routeName,
          ),
        ),
      ),
    );
  }
}
