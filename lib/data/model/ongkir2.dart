class Ongkir2 {
  bool success;
  String message;
  List<Data> data;

  Ongkir2({
    required this.success,
    required this.data,
    required this.message
  });

   Ongkir2.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        message = json['message'],
        data = List<Data>.from(json['pricing'].map((x) => Data.fromJson(x)));
}

class Data{
  String name;
  String serviceName;
  String duration;
  String serviceType;
  String price;

  Data({
    required this.name,
    required this.serviceName,
    required this.duration,
    required this.serviceType,
    required this.price
  });
  
  Data.fromJson(Map<String, dynamic> json)
      : name = json['courier_name'],
        serviceName = json['courier_service_name'],
        duration = json['duration'],
        serviceType = json['service_type'],
        price = json['price'];
}


//   "pricing":
// "available_for_cash_on_delivery": true,
//       "available_for_proof_of_delivery": false,
//       "available_for_instant_waybill_id": true,
//       "available_for_insurance": true,
//       "available_collection_method": ["pickup"],
//       "company": "jet",
//       "courier_name": "JET Express",
//       "courier_code": "jet",
//       "courier_service_name": "Cargo",
//       "courier_service_code": "crg",
//       "description": "Layanan kargo diatas 10 kg",
//       "duration": "3 - 6 Hari",
//       "shipment_duration_range": "3 - 6",
//       "shipment_duration_unit": "days",
//       "service_type": "standard",
//       "shipping_type": "freight",
//       "price": 24000,
//       "type": "crg"