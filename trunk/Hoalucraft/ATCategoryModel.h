//
//  ATCategoryModel.h
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/12/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "model/ATCategory.h"
#import "ATHoalucraft.h"

#define CATEGORY_ID                  @"id"
#define CATEGORY_NAME                @"name"
#define CATEGORY_TYPE                @"type"
#define CATEGORY_LANG                @"lang"
#define CATEGORY_IMAGE               @"image"
#define CATEGORY_BANNER              @"banner"
#define CATEGORY_URL                 @"url"
#define CATEGORY_SLUG                @"slug"
#define CATEGORY_DISCOUNT            @"discount"
#define CATEGORY_PROMOTION           @"promotion"
#define CATEGORY_LINK                @"link"
#define CATEGORY_DESCRIPTION         @"description"
#define CATEGORY_META_TITLE          @"meta_title"
#define CATEGORY_META_KEYWORD        @"meta_keyword"
#define CATEGORY_META_DESCRIPTION    @"meta_description"
#define CATEGORY_PARENT_ID           @"parent_id"
#define CATEGORY_LFT                 @"lft"
#define CATEGORY_RGHT                @"rght"
#define CATEGORY_STATUS              @"status"

@interface ATCategoryModel : NSObject
    @property (strong, nonatomic)NSMutableArray *categories;
    @property (nonatomic) int count;

    -(ATCategory*) getCategoryAt: (int) index;

    -(void) getAll;
@end
