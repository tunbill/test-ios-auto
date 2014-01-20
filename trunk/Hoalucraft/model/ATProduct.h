//
//  ATProduct.h
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/14/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATProduct : NSObject

@property (nonatomic)           long productId;
@property (nonatomic)           long categoryId;
@property (nonatomic)           long productMaketId;
@property (nonatomic)           long userId;
@property (strong, nonatomic) 	NSString *name;
@property (strong, nonatomic) 	NSString *lang;
@property (strong, nonatomic) 	NSString *sku;
@property (strong, nonatomic) 	NSString *model;
@property (strong, nonatomic) 	NSString *imageURL;
@property (nonatomic)           int quantity;
@property (nonatomic)           double	price;
@property (strong, nonatomic) 	NSString *unit;
@property (nonatomic)           double	discount;
@property (strong, nonatomic) 	NSString *discountUnit;
@property (strong, nonatomic) 	NSString *promotion;
@property (strong, nonatomic) 	NSString *warranty;
@property (strong, nonatomic) 	NSString *summary;
@property (strong, nonatomic) 	NSString *description;
@property (strong, nonatomic) 	NSString *tab1;
@property (strong, nonatomic) 	NSString *tab2;
@property (strong, nonatomic) 	NSString *tab3;
@property (strong, nonatomic) 	NSString *slug;
@property (strong, nonatomic) 	NSString *tag;
@property (strong, nonatomic) 	NSString *tagEncode;
@property (strong, nonatomic) 	NSString *metaTitle;
@property (strong, nonatomic) 	NSString *metaKeyword;
@property (strong, nonatomic) 	NSString *metaDescription;
@property (nonatomic)           int view;
@property (nonatomic)           int voteCount;
@property (nonatomic)           int voteStar;
@property (strong, nonatomic) 	NSString *file;
@property (nonatomic)       int created;
@property (nonatomic)       int modifired;
@property (nonatomic)       int status;

@end
