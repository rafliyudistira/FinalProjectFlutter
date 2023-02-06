import 'package:final_project/model/barang.dart';
import 'package:final_project/pages/add_barang.dart';
import 'package:final_project/pages/cart_barang.dart';
import 'package:final_project/pages/detail_riwayat.dart';
import 'package:final_project/pages/register.dart';
import 'package:final_project/pages/riwayat.dart';
import 'package:final_project/pages/screens/all_barang.dart';
import 'package:final_project/pages/screens/invoice_screens.dart';
import 'package:final_project/pages/screens/main_screens.dart';
import 'package:final_project/pages/screens/sell_screens.dart';
import 'package:final_project/pages/statistik_page.dart';
import 'package:final_project/pages/update_barang.dart';
import 'package:go_router/go_router.dart';
import 'package:final_project/pages/home.dart';
import 'package:final_project/pages/login.dart';
import 'package:final_project/main.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          return LoginPage();
        }),
    GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) {
          return RegisterPages();
        }),
    GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) {
          return HomePages();
        },
        routes: [
          GoRoute(
              path: 'screens',
              name: 'screens',
              builder: (context, state) {
                return MainScreen();
              },
              routes: [
                GoRoute(
                  path: 'add',
                  name: 'add',
                  builder: (context, state) {
                    // var fruit;
                    return AddBarang(
                        // fruit: fruit,
                        );
                  },
                ),
                // GoRoute(
                //   path: 'updatebarang',
                //   name: 'updatebarang',
                //   builder: (context, state) {
                //     return UpdateBarang();
                //   },
                // ),
                GoRoute(
                  path: 'sell',
                  name: 'sell',
                  builder: (context, state) {
                    return SellScreens(
                      goRouterState: state,
                      // harga: state.queryParams['harga']!,
                      // nama: state.params['nama']!,
                      // stock: state.queryParams['stock']!,
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'updatebarang',
                      name: 'updatebarang',
                      builder: (context, state) {
                        return UpdateBarang(
                          goRouterState: state,
                        );
                      },
                    ),
                  ],
                ),
                GoRoute(
                  path: 'allbarang',
                  name: 'allbarang',
                  builder: (context, state) {
                    return AllBarang();
                  },
                  // routes: [
                  //   GoRoute(
                  //     path: 'add',
                  //     name: 'add',
                  //     builder: (context, state) {
                  //       // var fruit;
                  //       return AddBarang(
                  //           // fruit: fruit,
                  //           );
                  //     },
                  //   ),
                  // ]
                ),
              ]),
          GoRoute(
              path: 'test',
              name: 'test',
              builder: (context, state) {
                return RegisterPages();
              }),
          GoRoute(
              path: 'invoice',
              name: 'invoice',
              builder: (context, state) {
                return InvoiceScreens();
              },
              routes: [
                GoRoute(
                    path: 'cart',
                    name: 'cart',
                    builder: (context, state) {
                      return CartBarang();
                    }),
              ]),
          GoRoute(
              path: 'statistik',
              name: 'statistik',
              builder: (context, state) {
                return Statistik();
              }),
          GoRoute(
              path: 'riwayat',
              name: 'riwayat',
              builder: (context, state) {
                return Riwayat();
              },
              routes: [
                GoRoute(
                    path: 'detail',
                    name: 'detail',
                    builder: (context, state) {
                      return DetailRiwayat(goRouterState: state,);
                    }),
              ]),
        ]),
  ], initialLocation: '/home', debugLogDiagnostics: true);
}
