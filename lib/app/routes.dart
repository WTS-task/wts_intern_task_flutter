import 'package:bot_toast/bot_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:wts_task/app/bottom_nav_bar.dart';
import 'package:wts_task/features/auth/presentation/view/otp_screen.dart';
import 'package:wts_task/features/auth/presentation/view/phone_auth_screen.dart';
import 'package:wts_task/features/cart/presentation/view/screens/cart_screen.dart';
import 'package:wts_task/features/cart/presentation/view/screens/checkout_screen.dart';
import 'package:wts_task/features/catalog/presentation/view/add_review_screen.dart';
import 'package:wts_task/features/catalog/presentation/view/catalog_screen.dart';
import 'package:wts_task/features/catalog/presentation/view/product_detail_screen.dart';
import 'package:wts_task/features/catalog/presentation/view/product_list_screen.dart';
import 'package:wts_task/features/catalog/presentation/view/product_reviews_screen.dart';
import 'package:wts_task/features/chat/presentation/view/support_chat_screen.dart';
import 'package:wts_task/features/profile/presentation/view/screens/edit_profile_screen.dart';
import 'package:wts_task/features/profile/presentation/view/screens/order_detail_screen.dart';
import 'package:wts_task/features/profile/presentation/view/screens/order_history_screen.dart';
import 'package:wts_task/features/profile/presentation/view/screens/profile_screen.dart';
import 'package:wts_task/core/services/auth_service.dart';
import '../features/profile/presentation/view/screens/profile_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/catalog',
  observers: [BotToastNavigatorObserver()],
  initialLocation: '/auth/phone',
  routes: [
    //Авторизация
    GoRoute(
      path: '/auth/phone',
      builder: (context, state) => const PhoneAuthScreen(),
    ),
    GoRoute(
        path: '/auth/otp',
        builder: (context, state){
          final phone = state.extra as String;
          return OtpScreen(phoneNumber: phone);
        }
    ),

    //Главный интерфейс
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell){
        return AppBottomNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/catalog',
              builder: (context, state) => const CatalogScreen(),
              routes: [
                GoRoute(
                  path: 'category/:categoryId',
                  builder: (context, state) => ProductListScreen(),
                  routes: [
                    GoRoute(
                      path: 'product/:productId',
                      builder: (context, state) => ProductDetailScreen(),
                      routes: [
                        GoRoute(
                          path: 'reviews',
                          builder: (context, state) => ProductReviewsScreen(),
                          routes: [
                            GoRoute(
                              path: 'add',
                              builder: (context, state) => AddReviewScreen(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        // Корзина
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/cart',
              builder: (context, state) => CartScreen(),
              routes: [
                GoRoute(
                  path: 'checkout',
                  name: 'checkout',
                  builder: (context, state) => const CheckoutScreen(),
                ),
              ],
            ),
          ],
        ),

        //Профиль
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
              routes: [
                GoRoute(
                  path: 'edit',
                  builder: (context, state) => const EditProfileScreen(),
                ),
                GoRoute(
                  path: 'orders',
                  name: 'orders',
                  builder: (context, state) => const OrderHistoryScreen(),
                  routes: [
                    GoRoute(
                      path: ':id',
                      name: 'order_detail',
                      builder: (context, state) => OrderDetailScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    //Поддержка
    GoRoute(
      path: '/support',
      builder: (context, state) => const SupportChatScreen(),
    ),
  ],

  redirect: (BuildContext context, GoRouterState state) async {

    final path = state.uri.path;

    if (!authService.isAuthenticated && !path.startsWith('/auth')) {
      return '/auth/phone';
    }

    if (authService.isAuthenticated && path.startsWith('/auth')) {
      return '/catalog';
    }

    return null;
  },
);
