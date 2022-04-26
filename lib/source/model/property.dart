class Properties {
  int? id;
  String? date;
  String? dateGmt;
  Guid? guid;
  String? modified;
  String? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  int? parent;
  int? menuOrder;
  String? commentStatus;
  String? pingStatus;
  String? template;
  List<dynamic>? propertyFeature;
  List<int>? propertyType;
  List<dynamic>? propertyLocation;
  List<int>? propertyStatus;
  PropertyMeta? propertyMeta;
  //todo uncomment
//  Links? lLinks;

  Properties(
      {this.id,
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.type,
        this.link,
        this.title,
        this.content,
        this.excerpt,
        this.author,
        this.featuredMedia,
        this.parent,
        this.menuOrder,
        this.commentStatus,
        this.pingStatus,
        this.template,
        this.propertyFeature,
        this.propertyType,
        this.propertyLocation,
        this.propertyStatus,
        this.propertyMeta});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ?  Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ?  Guid.fromJson(json['title']) : null;
    content =
    json['content'] != null ?  Content.fromJson(json['content']) : null;
    excerpt =
    json['excerpt'] != null ?  Content.fromJson(json['excerpt']) : null;
    author = json['author'];
    featuredMedia = json['featured_media'];
    parent = json['parent'];
    menuOrder = json['menu_order'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    template = json['template'];
    if (json['property-feature'] != null) {
      propertyFeature = <dynamic>[];
      json['property-feature'].forEach((v) {
        propertyFeature!.add(v);
      });
    }
    propertyType = json['property-type'].cast<int>();
    if (json['property-location'] != null) {
      propertyLocation = <dynamic>[];
      json['property-location'].forEach((v) {
        propertyLocation!.add(v);
      });
    }
    propertyStatus = json['property-status'].cast<int>();
    propertyMeta = json['property_meta'] != null
        ?  PropertyMeta.fromJson(json['property_meta'])
        : null;
    //todo uncomment
    // lLinks = json['_links'] != null ?  Links.fromJson(json['_links']) : null;
  }


}

class Guid {
  String? rendered;

  Guid({this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

}

class Content {
  String? rendered;
  bool? protected;

  Content({this.rendered, this.protected});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    data['protected'] = this.protected;
    return data;
  }
}

class PropertyMeta {
  String? rEALHOMESPropertySize;
  String? rEALHOMESPropertySizePostfix;
  String? rEALHOMESPropertyLotSize;
  String? rEALHOMESPropertyLotSizePostfix;
  String? rEALHOMESPropertyBedrooms;
  String? rEALHOMESPropertyBathrooms;
  String? rEALHOMESPropertyGarage;
  String? rEALHOMESPropertyId;
  String? rEALHOMESPropertyYearBuilt;
  String? rEALHOMESFeatured;
  List<dynamic>? rEALHOMESAdditionalDetailsList;
  String? rEALHOMESPropertyPrice;
  String? rvrInstantBooking;
  String? rvrPropertyOwner;
  REALHOMESPropertyLocation? rEALHOMESPropertyLocation;
  String? rEALHOMESPropertyAddress;
  String? rEALHOMESPropertyMap;
  List<REALHOMESPropertyImages>? rEALHOMESPropertyImages;
  String? rEALHOMESChangeGallerySliderType;
  String? rEALHOMESGallerySliderType;
  List<dynamic>? inspiryFloorPlans;
  List<dynamic>? inspiryVideoGroup;
  String? rEALHOMES360VirtualTour;
  String? rEALHOMESTourVideoUrl;
  List<dynamic>? rEALHOMESTourVideoImage;
  String? rEALHOMESAgentDisplayOption;
  List<dynamic>? rEALHOMESAgents;
  String? rEALHOMESEnergyClass;
  String? rEALHOMESEnergyPerformance;
  String? rEALHOMESEpcCurrentRating;
  String? rEALHOMESEpcPotentialRating;
  String? rEALHOMESSticky;
  String? inspiryPropertyLabel;
  String? inspiryPropertyLabelColor;
  String? inspiryPropertyTax;
  String? inspiryAdditionalFee;
  List<dynamic>? rEALHOMESAttachments;
  String? inspiryPropertyOwnerName;
  String? inspiryPropertyOwnerContact;
  String? inspiryPropertyOwnerAddress;
  String? rEALHOMESPropertyPrivateNote;
  String? inspiryMessageToReviewer;
  String? rEALHOMESAddInSlider;
  List<dynamic>? rEALHOMESSliderImage;
  List<dynamic>? rEALHOMESPageBannerImage;
  String? rEALHOMESHidePropertyAdvanceSearch;

  PropertyMeta(
      {this.rEALHOMESPropertySize,
        this.rEALHOMESPropertySizePostfix,
        this.rEALHOMESPropertyLotSize,
        this.rEALHOMESPropertyLotSizePostfix,
        this.rEALHOMESPropertyBedrooms,
        this.rEALHOMESPropertyBathrooms,
        this.rEALHOMESPropertyGarage,
        this.rEALHOMESPropertyId,
        this.rEALHOMESPropertyYearBuilt,
        this.rEALHOMESFeatured,
        this.rEALHOMESAdditionalDetailsList,
        this.rEALHOMESPropertyPrice,
        this.rvrInstantBooking,
        this.rvrPropertyOwner,
        this.rEALHOMESPropertyLocation,
        this.rEALHOMESPropertyAddress,
        this.rEALHOMESPropertyMap,
        this.rEALHOMESPropertyImages,
        this.rEALHOMESChangeGallerySliderType,
        this.rEALHOMESGallerySliderType,
        this.inspiryFloorPlans,
        this.inspiryVideoGroup,
        this.rEALHOMES360VirtualTour,
        this.rEALHOMESTourVideoUrl,
        this.rEALHOMESTourVideoImage,
        this.rEALHOMESAgentDisplayOption,
        this.rEALHOMESAgents,
        this.rEALHOMESEnergyClass,
        this.rEALHOMESEnergyPerformance,
        this.rEALHOMESEpcCurrentRating,
        this.rEALHOMESEpcPotentialRating,
        this.rEALHOMESSticky,
        this.inspiryPropertyLabel,
        this.inspiryPropertyLabelColor,
        this.inspiryPropertyTax,
        this.inspiryAdditionalFee,
        this.rEALHOMESAttachments,
        this.inspiryPropertyOwnerName,
        this.inspiryPropertyOwnerContact,
        this.inspiryPropertyOwnerAddress,
        this.rEALHOMESPropertyPrivateNote,
        this.inspiryMessageToReviewer,
        this.rEALHOMESAddInSlider,
        this.rEALHOMESSliderImage,
        this.rEALHOMESPageBannerImage,
        this.rEALHOMESHidePropertyAdvanceSearch});

  PropertyMeta.fromJson(Map<String, dynamic> json) {
    rEALHOMESPropertySize = json['REAL_HOMES_property_size'];
    rEALHOMESPropertySizePostfix = json['REAL_HOMES_property_size_postfix'];
    rEALHOMESPropertyLotSize = json['REAL_HOMES_property_lot_size'];
    rEALHOMESPropertyLotSizePostfix =
    json['REAL_HOMES_property_lot_size_postfix'];
    rEALHOMESPropertyBedrooms = json['REAL_HOMES_property_bedrooms'];
    rEALHOMESPropertyBathrooms = json['REAL_HOMES_property_bathrooms'];
    rEALHOMESPropertyGarage = json['REAL_HOMES_property_garage'];
    rEALHOMESPropertyId = json['REAL_HOMES_property_id'];
    rEALHOMESPropertyYearBuilt = json['REAL_HOMES_property_year_built'];
    rEALHOMESFeatured = json['REAL_HOMES_featured'];
    if (json['REAL_HOMES_additional_details_list'] != null) {
      rEALHOMESAdditionalDetailsList = <dynamic>[];
      json['REAL_HOMES_additional_details_list'].forEach((v) {
        rEALHOMESAdditionalDetailsList!.add(v);
      });
    }
    rEALHOMESPropertyPrice = json['REAL_HOMES_property_price'];
    rvrInstantBooking = json['rvr_instant_booking'];
    rvrPropertyOwner = json['rvr_property_owner'];
    rEALHOMESPropertyLocation = json['REAL_HOMES_property_location'] != null
        ?  REALHOMESPropertyLocation.fromJson(
        json['REAL_HOMES_property_location'])
        : null;
    rEALHOMESPropertyAddress = json['REAL_HOMES_property_address'];
    rEALHOMESPropertyMap = json['REAL_HOMES_property_map'];
    if (json['REAL_HOMES_property_images'] != null) {
      rEALHOMESPropertyImages = <REALHOMESPropertyImages>[];
      json['REAL_HOMES_property_images'].forEach((v) {
        rEALHOMESPropertyImages!.add( REALHOMESPropertyImages.fromJson(v));
      });
    }
    rEALHOMESChangeGallerySliderType =
    json['REAL_HOMES_change_gallery_slider_type'];
    rEALHOMESGallerySliderType = json['REAL_HOMES_gallery_slider_type'];
    if (json['inspiry_floor_plans'] != null) {
      inspiryFloorPlans = <dynamic>[];
      json['inspiry_floor_plans'].forEach((v) {
        inspiryFloorPlans!.add(v);
      });
    }
    if (json['inspiry_video_group'] != null) {
      inspiryVideoGroup = <dynamic>[];
      json['inspiry_video_group'].forEach((v) {
        inspiryVideoGroup!.add(v);
      });
    }
    rEALHOMES360VirtualTour = json['REAL_HOMES_360_virtual_tour'];
    rEALHOMESTourVideoUrl = json['REAL_HOMES_tour_video_url'];
    if (json['REAL_HOMES_tour_video_image'] != null) {
      rEALHOMESTourVideoImage = <dynamic>[];
      json['REAL_HOMES_tour_video_image'].forEach((v) {
        rEALHOMESTourVideoImage!.add(v);
      });
    }
    rEALHOMESAgentDisplayOption = json['REAL_HOMES_agent_display_option'];
    if (json['REAL_HOMES_agents'] != null) {
      rEALHOMESAgents = <dynamic>[];
      json['REAL_HOMES_agents'].forEach((v) {
        //todo uncomment
        rEALHOMESAgents!.add(v);
      });
    }
    rEALHOMESEnergyClass = json['REAL_HOMES_energy_class'];
    rEALHOMESEnergyPerformance = json['REAL_HOMES_energy_performance'];
    rEALHOMESEpcCurrentRating = json['REAL_HOMES_epc_current_rating'];
    rEALHOMESEpcPotentialRating = json['REAL_HOMES_epc_potential_rating'];
    rEALHOMESSticky = json['REAL_HOMES_sticky'];
    inspiryPropertyLabel = json['inspiry_property_label'];
    inspiryPropertyLabelColor = json['inspiry_property_label_color'];
    inspiryPropertyTax = json['inspiry_property_tax'];
    inspiryAdditionalFee = json['inspiry_additional_fee'];
    if (json['REAL_HOMES_attachments'] != null) {
      rEALHOMESAttachments = <dynamic>[];
      json['REAL_HOMES_attachments'].forEach((v) {
        rEALHOMESAttachments!.add(v);
      });
    }
    inspiryPropertyOwnerName = json['inspiry_property_owner_name'];
    inspiryPropertyOwnerContact = json['inspiry_property_owner_contact'];
    inspiryPropertyOwnerAddress = json['inspiry_property_owner_address'];
    rEALHOMESPropertyPrivateNote = json['REAL_HOMES_property_private_note'];
    inspiryMessageToReviewer = json['inspiry_message_to_reviewer'];
    rEALHOMESAddInSlider = json['REAL_HOMES_add_in_slider'];
    if (json['REAL_HOMES_slider_image'] != null) {
      rEALHOMESSliderImage = <dynamic>[];
      json['REAL_HOMES_slider_image'].forEach((v) {
        rEALHOMESSliderImage!.add(v);
      });
    }
    if (json['REAL_HOMES_page_banner_image'] != null) {
      rEALHOMESPageBannerImage = <dynamic>[];
      json['REAL_HOMES_page_banner_image'].forEach((v) {
        rEALHOMESPageBannerImage!.add(v);
      });
    }
    rEALHOMESHidePropertyAdvanceSearch =
    json['REAL_HOMES_hide_property_advance_search'];
  }
}

class REALHOMESPropertyLocation {
  String? latitude;
  String? longitude;
  String? zoom;

  REALHOMESPropertyLocation({this.latitude, this.longitude, this.zoom});

  REALHOMESPropertyLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    zoom = json['zoom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['zoom'] = this.zoom;
    return data;
  }
}

class REALHOMESPropertyImages {
  int? width;
  int? height;
  String? file;
  Sizes? sizes;
  ImageMeta? imageMeta;
  String? iD;
  String? name;
  String? path;
  String? url;
  String? fullUrl;
  String? title;
  String? caption;
  String? description;
  String? alt;
  String? srcset;

  REALHOMESPropertyImages(
      {this.width,
        this.height,
        this.file,
        this.sizes,
        this.imageMeta,
        this.iD,
        this.name,
        this.path,
        this.url,
        this.fullUrl,
        this.title,
        this.caption,
        this.description,
        this.alt,
        this.srcset});

  REALHOMESPropertyImages.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    file = json['file'];
    sizes = json['sizes'] != null ? new Sizes.fromJson(json['sizes']) : null;
    imageMeta = json['image_meta'] != null
        ? new ImageMeta.fromJson(json['image_meta'])
        : null;
    iD = json['ID'];
    name = json['name'];
    path = json['path'];
    url = json['url'];
    fullUrl = json['full_url'];
    title = json['title'];
    caption = json['caption'];
    description = json['description'];
    alt = json['alt'];
    srcset = json['srcset'];
  }

}

class Sizes {
  Medium? medium;
  Medium? thumbnail;
  Medium? postThumbnail;
  Medium? modernPropertyChildSlider;
  Medium? propertyThumbImage;
  Medium? propertyDetailVideoImage;
  Medium? agentImage;
  Medium? postFeaturedImage;
  WoocommerceThumbnail? woocommerceThumbnail;
  Medium? woocommerceGalleryThumbnail;
  Medium? shopCatalog;
  Medium? shopThumbnail;

  Sizes(
      {this.medium,
        this.thumbnail,
        this.postThumbnail,
        this.modernPropertyChildSlider,
        this.propertyThumbImage,
        this.propertyDetailVideoImage,
        this.agentImage,
        this.postFeaturedImage,
        this.woocommerceThumbnail,
        this.woocommerceGalleryThumbnail,
        this.shopCatalog,
        this.shopThumbnail});

  Sizes.fromJson(Map<String, dynamic> json) {
    medium =
    json['medium'] != null ?  Medium.fromJson(json['medium']) : null;
    thumbnail = json['thumbnail'] != null
        ?  Medium.fromJson(json['thumbnail'])
        : null;
    postThumbnail = json['post-thumbnail'] != null
        ?  Medium.fromJson(json['post-thumbnail'])
        : null;
    modernPropertyChildSlider = json['modern-property-child-slider'] != null
        ?  Medium.fromJson(json['modern-property-child-slider'])
        : null;
    propertyThumbImage = json['property-thumb-image'] != null
        ?  Medium.fromJson(json['property-thumb-image'])
        : null;
    propertyDetailVideoImage = json['property-detail-video-image'] != null
        ?  Medium.fromJson(json['property-detail-video-image'])
        : null;
    agentImage = json['agent-image'] != null
        ?  Medium.fromJson(json['agent-image'])
        : null;
    postFeaturedImage = json['post-featured-image'] != null
        ?  Medium.fromJson(json['post-featured-image'])
        : null;
    woocommerceThumbnail = json['woocommerce_thumbnail'] != null
        ?  WoocommerceThumbnail.fromJson(json['woocommerce_thumbnail'])
        : null;
    woocommerceGalleryThumbnail = json['woocommerce_gallery_thumbnail'] != null
        ?  Medium.fromJson(json['woocommerce_gallery_thumbnail'])
        : null;
    shopCatalog = json['shop_catalog'] != null
        ?  Medium.fromJson(json['shop_catalog'])
        : null;
    shopThumbnail = json['shop_thumbnail'] != null
        ?  Medium.fromJson(json['shop_thumbnail'])
        : null;
  }

}

class Medium {
  String? file;
  int? width;
  int? height;
  String? mimeType;
  String? url;

  Medium({this.file, this.width, this.height, this.mimeType, this.url});

  Medium.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime-type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['width'] = this.width;
    data['height'] = this.height;
    data['mime-type'] = this.mimeType;
    data['url'] = this.url;
    return data;
  }
}

class WoocommerceThumbnail {
  String? file;
  int? width;
  int? height;
  String? mimeType;
  bool? uncropped;
  String? url;

  WoocommerceThumbnail(
      {this.file,
        this.width,
        this.height,
        this.mimeType,
        this.uncropped,
        this.url});

  WoocommerceThumbnail.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime-type'];
    uncropped = json['uncropped'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['width'] = this.width;
    data['height'] = this.height;
    data['mime-type'] = this.mimeType;
    data['uncropped'] = this.uncropped;
    data['url'] = this.url;
    return data;
  }
}

class ImageMeta {
  String? aperture;
  String? credit;
  String? camera;
  String? caption;
  String? createdTimestamp;
  String? copyright;
  String? focalLength;
  String? iso;
  String? shutterSpeed;
  String? title;
  String? orientation;
  List<dynamic>? keywords;

  ImageMeta(
      {this.aperture,
        this.credit,
        this.camera,
        this.caption,
        this.createdTimestamp,
        this.copyright,
        this.focalLength,
        this.iso,
        this.shutterSpeed,
        this.title,
        this.orientation,
        this.keywords});

  ImageMeta.fromJson(Map<String, dynamic> json) {
    aperture = json['aperture'];
    credit = json['credit'];
    camera = json['camera'];
    caption = json['caption'];
    createdTimestamp = json['created_timestamp'];
    copyright = json['copyright'];
    focalLength = json['focal_length'];
    iso = json['iso'];
    shutterSpeed = json['shutter_speed'];
    title = json['title'];
    orientation = json['orientation'];
    if (json['keywords'] != null) {
      keywords = <Null>[];
      json['keywords'].forEach((v) {
        keywords!.add(v);
      });
    }
  }

}

// class Links {
//   List<Self>? self;
//   List<Collection>? collection;
//   List<About>? about;
//   List<Author>? author;
//   List<Replies>? replies;
//   List<VersionHistory>? versionHistory;
//   List<PredecessorVersion>? predecessorVersion;
//   List<WpFeaturedmedia>? wpFeaturedmedia;
//   List<WpAttachment>? wpAttachment;
//   List<WpTerm>? wpTerm;
//   List<Curies>? curies;
//
//   Links(
//       {this.self,
//         this.collection,
//         this.about,
//         this.author,
//         this.replies,
//         this.versionHistory,
//         this.predecessorVersion,
//         this.wpFeaturedmedia,
//         this.wpAttachment,
//         this.wpTerm,
//         this.curies});
//
//   Links.fromJson(Map<String, dynamic> json) {
//     if (json['self'] != null) {
//       self = <Self>[];
//       json['self'].forEach((v) {
//         self!.add(new Self.fromJson(v));
//       });
//     }
//     if (json['collection'] != null) {
//       collection = <Collection>[];
//       json['collection'].forEach((v) {
//         collection!.add(new Collection.fromJson(v));
//       });
//     }
//     if (json['about'] != null) {
//       about = <About>[];
//       json['about'].forEach((v) {
//         about!.add(new About.fromJson(v));
//       });
//     }
//     if (json['author'] != null) {
//       author = <Author>[];
//       json['author'].forEach((v) {
//         author!.add(new Author.fromJson(v));
//       });
//     }
//     if (json['replies'] != null) {
//       replies = <Replies>[];
//       json['replies'].forEach((v) {
//         replies!.add(new Replies.fromJson(v));
//       });
//     }
//     if (json['version-history'] != null) {
//       versionHistory = <VersionHistory>[];
//       json['version-history'].forEach((v) {
//         versionHistory!.add(new VersionHistory.fromJson(v));
//       });
//     }
//     if (json['predecessor-version'] != null) {
//       predecessorVersion = <PredecessorVersion>[];
//       json['predecessor-version'].forEach((v) {
//         predecessorVersion!.add(new PredecessorVersion.fromJson(v));
//       });
//     }
//     if (json['wp:featuredmedia'] != null) {
//       wpFeaturedmedia = <WpFeaturedmedia>[];
//       json['wp:featuredmedia'].forEach((v) {
//         wpFeaturedmedia!.add(new WpFeaturedmedia.fromJson(v));
//       });
//     }
//     if (json['wp:attachment'] != null) {
//       wpAttachment = <WpAttachment>[];
//       json['wp:attachment'].forEach((v) {
//         wpAttachment!.add(new WpAttachment.fromJson(v));
//       });
//     }
//     if (json['wp:term'] != null) {
//       wpTerm = <WpTerm>[];
//       json['wp:term'].forEach((v) {
//         wpTerm!.add(new WpTerm.fromJson(v));
//       });
//     }
//     if (json['curies'] != null) {
//       curies = <Curies>[];
//       json['curies'].forEach((v) {
//         curies!.add(new Curies.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.self != null) {
//       data['self'] = this.self!.map((v) => v.toJson()).toList();
//     }
//     if (this.collection != null) {
//       data['collection'] = this.collection!.map((v) => v.toJson()).toList();
//     }
//     if (this.about != null) {
//       data['about'] = this.about!.map((v) => v.toJson()).toList();
//     }
//     if (this.author != null) {
//       data['author'] = this.author!.map((v) => v.toJson()).toList();
//     }
//     if (this.replies != null) {
//       data['replies'] = this.replies!.map((v) => v.toJson()).toList();
//     }
//     if (this.versionHistory != null) {
//       data['version-history'] =
//           this.versionHistory!.map((v) => v.toJson()).toList();
//     }
//     if (this.predecessorVersion != null) {
//       data['predecessor-version'] =
//           this.predecessorVersion!.map((v) => v.toJson()).toList();
//     }
//     if (this.wpFeaturedmedia != null) {
//       data['wp:featuredmedia'] =
//           this.wpFeaturedmedia!.map((v) => v.toJson()).toList();
//     }
//     if (this.wpAttachment != null) {
//       data['wp:attachment'] =
//           this.wpAttachment!.map((v) => v.toJson()).toList();
//     }
//     if (this.wpTerm != null) {
//       data['wp:term'] = this.wpTerm!.map((v) => v.toJson()).toList();
//     }
//     if (this.curies != null) {
//       data['curies'] = this.curies!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

}

class Author {
  bool? embeddable;
  String? href;

  Author({this.embeddable, this.href});

  Author.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }


}

class VersionHistory {
  int? count;
  String? href;

  VersionHistory({this.count, this.href});

  VersionHistory.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    href = json['href'];
  }


}

class PredecessorVersion {
  int? id;
  String? href;

  PredecessorVersion({this.id, this.href});

  PredecessorVersion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    href = json['href'];
  }

}

class WpTerm {
  String? taxonomy;
  bool? embeddable;
  String? href;

  WpTerm({this.taxonomy, this.embeddable, this.href});

  WpTerm.fromJson(Map<String, dynamic> json) {
    taxonomy = json['taxonomy'];
    embeddable = json['embeddable'];
    href = json['href'];
  }


}

class Curies {
  String? name;
  String? href;
  bool? templated;

  Curies({this.name, this.href, this.templated});

  Curies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    href = json['href'];
    templated = json['templated'];
  }

}
