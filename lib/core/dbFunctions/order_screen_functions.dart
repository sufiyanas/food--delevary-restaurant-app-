import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delevary_admin/infrastructure/order_modal.dart';

Stream<List<OrderModal>> getOrderStream() {
  return FirebaseFirestore.instance.collection("Orders").snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => OrderModal.fromJson(doc.data())).toList());
}

//order compleate update

updateOrderComplete({required OrderModal orderModal}) async {
  final orderReff =
      FirebaseFirestore.instance.collection("Orders").doc(orderModal.dishname);

  final order = OrderModal(
      userAddress: orderModal.userAddress,
      userEmail: orderModal.userEmail,
      hotalEmail: orderModal.hotalEmail,
      dishname: orderModal.dishname,
      orginalPrice: orderModal.orginalPrice,
      imageURL: orderModal.imageURL,
      cartCount: orderModal.cartCount,
      trackOrder: 2,
      isCompleated: true);

  final json = order.toJson();

  await orderReff.update(json);
}
