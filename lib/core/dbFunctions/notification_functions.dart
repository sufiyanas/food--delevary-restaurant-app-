import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delevary_admin/infrastructure/hotal_information.dart';
import 'package:food_delevary_admin/infrastructure/order_modal.dart';

Stream<List<OrderModal>> getOrderStream({required String userEmail}) {
  return FirebaseFirestore.instance.collection("Orders").snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => OrderModal.fromJson(doc.data())).toList());
}

//
allowOrder({required String hotalEmail, required OrderModal order}) async {
  final oederreff =
      FirebaseFirestore.instance.collection("Orders").doc(order.dishname);

  final OrderModal orderModaldata = OrderModal(
    userAddress: order.userAddress,
    userEmail: order.userEmail,
    hotalEmail: order.hotalEmail,
    dishname: order.dishname,
    orginalPrice: order.orginalPrice,
    imageURL: order.imageURL,
    cartCount: order.cartCount,
    trackOrder: 1,
    isCompleated: false,
  );
  final ordermodaldataJson = orderModaldata.toJson();
  await oederreff.update(ordermodaldataJson);
}

//cancell order

cancelOrder({required String hotalEmail, required OrderModal order}) async {
  final oederreff =
      FirebaseFirestore.instance.collection("Orders").doc(order.dishname);

  final OrderModal orderModaldata = OrderModal(
      userAddress: order.userAddress,
      userEmail: order.userEmail,
      hotalEmail: order.hotalEmail,
      dishname: order.dishname,
      orginalPrice: order.orginalPrice,
      imageURL: order.imageURL,
      cartCount: order.cartCount,
      trackOrder: 2,
      isCompleated: false);

  final ordermodaldataJson = orderModaldata.toJson();
  await oederreff.update(ordermodaldataJson);
}
