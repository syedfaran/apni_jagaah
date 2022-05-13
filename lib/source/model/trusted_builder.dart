class TrustedBuilder {
  int? id;
  String? modifiedGmt;
  Title? title;
  Embedded? eEmbedded;

  TrustedBuilder({this.id, this.modifiedGmt, this.title, this.eEmbedded});

  TrustedBuilder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modifiedGmt = json['modified_gmt'];
    title = json['title'] != null ?  Title.fromJson(json['title']) : null;
    eEmbedded = json['_embedded'] != null
        ?  Embedded.fromJson(json['_embedded'])
        : null;
  }

}

class Title {
  String? rendered;

  Title({this.rendered});

  Title.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

}

class Embedded {
  List<WpFeaturedmedia>? wpFeaturedmedia;

  Embedded({this.wpFeaturedmedia});

  Embedded.fromJson(Map<String, dynamic> json) {
    if (json['wp:featuredmedia'] != null) {
      wpFeaturedmedia = <WpFeaturedmedia>[];
      json['wp:featuredmedia'].forEach((v) {
        wpFeaturedmedia!.add(WpFeaturedmedia.fromJson(v));
      });
    }
  }

}

class WpFeaturedmedia {
  String? sourceUrl;

  WpFeaturedmedia({this.sourceUrl});

  WpFeaturedmedia.fromJson(Map<String, dynamic> json) {
    sourceUrl = json['source_url'];
  }
}
