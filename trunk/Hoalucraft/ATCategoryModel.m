//
//  ATCategoryModel.m
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/12/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import "ATCategoryModel.h"
#import "ATCategory.h"

@implementation ATCategoryModel
@synthesize categories, count;

-(ATCategory*) getCategoryAt: (int) index {
    if( index< [[self categories] count] && index >= 0) {
        return (ATCategory*)[[self categories] objectAtIndex:index];
    } else {
        return nil;
    }
}

-(void) getAll {
    NSString * dataURL = [SERVICE_PATH stringByAppendingString: @"/category/categories/en"];
    
    NSURL * dataUrl = [NSURL URLWithString:dataURL];
    NSData *datas = [NSData dataWithContentsOfURL:dataUrl];
 
    NSDictionary * jsonData = [NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingMutableContainers error:	nil];
    
    NSMutableArray * jsonDataDetail = [jsonData valueForKey:@"category"];
    
    self.categories = [[NSMutableArray alloc] init];
    for(int i = 0;i < [jsonDataDetail count];i ++) {
        NSData *data = [jsonDataDetail objectAtIndex: i];
        
        ATCategory * category = [[ATCategory alloc] init];
        
        [category setCategoryId: [[data valueForKey: CATEGORY_ID] integerValue]];
        [category setName: (NSString *)[data valueForKey: CATEGORY_NAME]];
        [category setType: (NSString *)[data valueForKey: CATEGORY_TYPE]];
        [category setLang: (NSString *)[data valueForKey: CATEGORY_LANG]];
        [category setImage: (NSString *) [data valueForKey: CATEGORY_IMAGE]];
        [category setBanner: (NSString *)[data valueForKey: CATEGORY_BANNER]];
        [category setUrl: (NSString *)[data valueForKey: CATEGORY_URL]];
        [category setSlug: (NSString *)[data valueForKey: CATEGORY_SLUG]];
        [category setDiscount: [[data valueForKey: CATEGORY_DISCOUNT] integerValue]];
        [category setPromotion: (NSString *)[data valueForKey: CATEGORY_PROMOTION]];
        [category setLink: (NSString *)[data valueForKey: CATEGORY_LINK]];
        [category setDescription: (NSString *)[data valueForKey: CATEGORY_DESCRIPTION] ];
        [category setMetaTitle: (NSString *)[data valueForKey: CATEGORY_META_TITLE] ];
        [category setMetaKeyword: (NSString *)[data valueForKey: CATEGORY_META_KEYWORD]];
        [category setMetaDescription:(NSString *)[data valueForKey: CATEGORY_META_DESCRIPTION] ];
        [category setParentId: [[data valueForKey: CATEGORY_PARENT_ID] integerValue]];
        [category setLft: [[data valueForKey: CATEGORY_LFT] integerValue]];
        [category setRght: [[data valueForKey: CATEGORY_RGHT] integerValue]];
        [category setStatus: [[data valueForKey: CATEGORY_STATUS] integerValue]];
        
        [self.categories addObject:category];
    }
    //Temp
    [self setCount: [categories count]];
}

-(void) countAll {
    
}
@end
