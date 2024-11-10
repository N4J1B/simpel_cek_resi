class Bookmark {
  List<Detail> listBookmark;

  Bookmark({
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