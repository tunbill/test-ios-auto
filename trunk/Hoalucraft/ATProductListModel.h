//
//  ATProductListModel.h
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/14/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATCategory.h"
#import "ATHoalucraft.h"
#import "ATProduct.h"

#define PRODUCT_ID                  @"id"
#define PRODUCT_CATEGORY_ID         @"product_category_id"
#define PRODUCT_MAKER_ID            @"product_maker_id"
#define PRODUCT_USER_ID             @"user_id"
#define PRODUCT_NAME                @"name"
#define PRODUCT_LANG                @"lang"
#define PRODUCT_SKU                 @"sku"
#define PRODUCT_MODEL               @"model"
#define PRODUCT_IMAGE               @"image"
#define PRODUCT_QUANTITY            @"quantity"
#define PRODUCT_PRICE               @"price"
#define PRODUCT_UNIT                @"unit"
#define PRODUCT_DISCOUNT            @"discount"
#define PRODUCT_DISCOUNT_UNIT       @"discount_unit"
#define PRODUCT_PROMOTION           @"promotion"
#define PRODUCT_WARRANTY            @"warranty"
#define PRODUCT_SUMMARY             @"summary"
#define PRODUCT_DESCRIPTION         @"description"
#define PRODUCT_TAB1                @"tab1"
#define PRODUCT_TAB2                @"tab2"
#define PRODUCT_TAB3                @"tab3"
#define PRODUCT_SLUG                @"slug"
#define PRODUCT_TAG                 @"tag"
#define PRODUCT_TAG_ENCODE          @"tag_encode"
#define PRODUCT_META_TITLE          @"meta_title"
#define PRODUCT_META_KEYWORD        @"meta_keyword"
#define PRODUCT_META_DESCRIPTION    @"meta_description"
#define PRODUCT_VIEW                @"view"
#define PRODUCT_VOTE_COUNTER        @"vote_counter"
#define PRODUCT_VOTE_STAR           @"vote_star"
#define PRODUCT_FILE                @"file"
#define PRODUCT_CREATED             @"created"
#define PRODUCT_MODIFIRED           @"modifired"
#define PRODUCT_STATUS              @"status"

@interface ATProductListModel : NSObject

extern int const DEFAULT_COUNT;

@property (strong, nonatomic) ATCategory * category;
@property (strong, nonatomic) NSMutableArray *products;
@property (nonatomic) int start;
@property (nonatomic) int count;

- (id)init;

-(id) initWithATCategory : (ATCategory *) pCategory;

-(void) countByCategory;

-(ATProduct*) getProductAt: (int) index;

-(NSMutableArray *) next;
@end