import 'package:go_router/go_router.dart';
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
import 'package:wts_task/features/profile/presentation/view/edit_profile_screen.dart';
import 'package:wts_task/features/profile/presentation/view/order_detail_screen.dart';
import 'package:wts_task/features/profile/presentation/view/order_history_screen.dart';
import 'package:wts_task/features/profile/presentation/view/profile_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/catalog',
  routes: [
    GoRoute(
      path: '/auth/phone',
      builder: (context, state) => const PhoneAuthScreen(),
    ),
    GoRoute(path: '/auth/otp', builder: (context, state) => const OtpScreen()),
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
    // Корзина
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
    // Профиль
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
          builder: (context, state) => const OrderHistoryScreen(),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) => OrderDetailScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/support',
      builder: (context, state) => const SupportChatScreen(),
    ),
  ],
);
