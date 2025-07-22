import 'package:wts_task/features/profile/data/models/order_detail.dart';
import 'package:wts_task/features/profile/data/models/shop_order.dart';
import 'package:wts_task/features/profile/data/models/shop_order_item.dart';

final fakeOrders = [
  OrderDetail(
    shopOrder: ShopOrder(
      shopOrderId: 1001,
      userId: 1,
      status: 2,
      address: "Berlin, Alexanderplatz 1",
      phoneNumber: "+49 123 4567890",
      comment: "Оставить у двери",
      totalPrice: 34990,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      shopOrderItems: [
        ShopOrderItem(
          productId: 101,
          name:
              "Наушники Bluetooth asdsdadsdsasdadadasdadsadsadsasdasdadadsadsasdads",
          productDescription: "Беспроводные наушники с шумоподавлением",
          imageUrl: "https://s.a-5.ru/i/file/161/7/0d/ce/0dce0e51f77de7bc.jpg",
          price: 100,
          count: 1,
        ),
        ShopOrderItem(
          productId: 102,
          name: "Чехол для телефона",
          productDescription: "Силиконовый чехол для iPhone",
          imageUrl:
              "https://ae01.alicdn.com/kf/Sbe2ec612c79543c6b29e061b456a1d32u.jpg",
          price: 1500,
          count: 1,
        ),
      ],
    ),
  ),
  OrderDetail(
    shopOrder: ShopOrder(
      shopOrderId: 1002,
      userId: 1,
      status: 0,
      address: "Frankfurt am Main, Zeil 106",
      phoneNumber: "+49 987 6543210",
      totalPrice: 12000,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      shopOrderItems: [
        ShopOrderItem(
          productId: 201,
          name: "Беспроводная мышь",
          productDescription: "Удобная мышь для ноутбука",
          imageUrl:
              "https://ae01.alicdn.com/kf/Sbe2ec612c79543c6b29e061b456a1d32u.jpg",
          price: 12000,
          count: 1,
        ),
        ShopOrderItem(
          productId: 211,
          name: "Беспроводная мышь",
          productDescription: "Удобная мышь для ноутбука",
          imageUrl:
              "https://ae01.alicdn.com/kf/Sbe2ec612c79543c6b29e061b456a1d32u.jpg",
          price: 12000,
          count: 1,
        ),
        ShopOrderItem(
          productId: 221,
          name: "Беспроводная мышь",
          productDescription: "Удобная мышь для ноутбука",
          imageUrl:
              "https://ae01.alicdn.com/kf/Sbe2ec612c79543c6b29e061b456a1d32u.jpg",
          price: 12000,
          count: 1,
        ),
      ],
    ),
  ),
  OrderDetail(
    shopOrder: ShopOrder(
      shopOrderId: 1002,
      userId: 1,
      status: 0,
      address: "Frankfurt am Main, Zeil 106",
      phoneNumber: "+49 987 6543210",
      totalPrice: 12000,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      shopOrderItems: [
        ShopOrderItem(
          productId: 201,
          name: "Беспроводная мышь",
          productDescription: "Удобная мышь для ноутбука",
          imageUrl:
              "https://ae01.alicdn.com/kf/Sbe2ec612c79543c6b29e061b456a1d32u.jpg",
          price: 12000,
          count: 1,
        ),
      ],
    ),
  ),
];
