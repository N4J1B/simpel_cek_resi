class Recent {
  List<Detail> listBookmark;

  Recent({
    required this.listBookmark
  });
}

class Detail {
  String name;
  String awb;
  String courier;

  Detail({
    required this.name,
    required this.awb,
    required this.courier
  });
}