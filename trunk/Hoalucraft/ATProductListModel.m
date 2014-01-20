//
//  ATProductListModel.m
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/14/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import "ATProductListModel.h"
@interface ATProductListModel ()

@end

@implementation ATProductListModel

int const DEFAULT_COUNT = 10;

@synthesize category, products, count;

- (id)init {
    self = [super init];
    [self setCount: 0];
    [self setStart: 0];
    [self setCategory:nil];
    [self setProducts: [[NSMutableArray alloc] init]];
    return self;
}

-(id) initWithATCategory : (ATCategory *) pCategory {
    self = [super init];
    [self setCategory: pCategory];
    [self setStart:0];
    [self setProducts: [[NSMutableArray alloc] init]];
    
    [self countByCategory];
    NSMutableArray * pros = [self getByCategory: [self start] count: DEFAULT_COUNT];
    
    //NSMutableArray * pros = [self getByCategory: [self start] count: [self count]];
    
    if( pros != nil) {
        [self setProducts: pros];
    }
    return self;
}

-(NSMutableArray * ) getByCategory : (int) lStart count:(int) lCount{
    if ([self category] == nil) {
        return nil;
    }
    
    
    NSString * params = [NSString stringWithFormat:@"%ld/%@/%d/%d", [[self category] categoryId], @"en", lStart, lCount];
    NSString * dataURL = [[SERVICE_PATH stringByAppendingString: @"/product/products/"] stringByAppendingString:params];
    
    NSURL * dataUrl = [NSURL URLWithString:dataURL];
    NSData *datas = [NSData dataWithContentsOfURL:dataUrl];
    
    NSDictionary * jsonData = [NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingMutableContainers error:	nil];
    
    NSMutableArray * jsonDataDetail = [jsonData valueForKey:@"product"];
    
    if( jsonData != nil && [jsonData count] > 0) {
        NSMutableArray * lProducts = [[NSMutableArray alloc] init];
        
        for (NSData *data in jsonDataDetail) {
            ATProduct * product = [[ATProduct alloc] init];
            
            [product setProductId: [[data valueForKey:PRODUCT_ID] integerValue]];
            [product setCategoryId: [[data valueForKey:PRODUCT_CATEGORY_ID] integerValue]];
            [product setProductMaketId: [[data valueForKey:PRODUCT_MAKER_ID] integerValue]];
            [product setUserId: [[data valueForKey:PRODUCT_USER_ID] integerValue]];
            [product setName: (NSString *)[data valueForKey:PRODUCT_NAME]];
            [product setLang: (NSString *)[data valueForKey:PRODUCT_LANG]];
            [product setSku:(NSString *)[data valueForKey:PRODUCT_SKU]];
            [product setModel:(NSString *) [data valueForKey:PRODUCT_MODEL]];
            [product setImageURL:(NSString *) [data valueForKey:PRODUCT_IMAGE]];
            [product setQuantity: [[data valueForKey:PRODUCT_QUANTITY] integerValue]];
            [product setPrice: [[data valueForKey:PRODUCT_PRICE] doubleValue]];
            [product setUnit:(NSString *) [data valueForKey:PRODUCT_UNIT]];
            [product setDiscount: [[data valueForKey:PRODUCT_DISCOUNT] doubleValue]];
            [product setDiscountUnit:(NSString *) [data valueForKey:PRODUCT_DISCOUNT_UNIT]];
            [product setPromotion:(NSString *) [data valueForKey:PRODUCT_PROMOTION]];
            [product setWarranty:(NSString *) [data valueForKey:PRODUCT_WARRANTY]];
            [product setSummary:(NSString *) [data valueForKey:PRODUCT_SUMMARY]];
            [product setDescription:(NSString *) [data valueForKey:PRODUCT_DESCRIPTION]];
            [product setTab1:(NSString *) [data valueForKey:PRODUCT_TAB1]];
            [product setTab2:(NSString *) [data valueForKey:PRODUCT_TAB2]];
            [product setTab3:(NSString *) [data valueForKey:PRODUCT_TAB3]];
            [product setSlug:(NSString *) [data valueForKey:PRODUCT_SLUG]];
            [product setTag:(NSString *) [data valueForKey:PRODUCT_TAG]];
            [product setTagEncode:(NSString *) [data valueForKey:PRODUCT_TAG_ENCODE]];
            [product setMetaTitle:(NSString *) [data valueForKey:PRODUCT_META_TITLE]];
            [product setMetaKeyword:(NSString *) [data valueForKey:PRODUCT_META_KEYWORD]];
            [product setMetaDescription:(NSString *) [data valueForKey:PRODUCT_META_DESCRIPTION]];
            [product setView: [[data valueForKey:PRODUCT_VIEW] integerValue]];
            [product setVoteCount: [[data valueForKey:PRODUCT_VOTE_COUNTER] integerValue]];
            [product setVoteStar: [[data valueForKey:PRODUCT_VOTE_STAR] integerValue]];
            [product setFile:(NSString *) [data valueForKey:PRODUCT_FILE]];
            [product setCreated:  [[data valueForKey:PRODUCT_CREATED] integerValue]];
            [product setModifired: [[data valueForKey:PRODUCT_MODIFIRED] integerValue]];
            [product setStatus: [[data valueForKey:PRODUCT_STATUS] integerValue]];
            
            
            [lProducts addObject: product];
        }
        return lProducts;
    }
    return nil;
}

-(void)countByCategory {
    if ([self category] == nil) {
        return ;
    }
    
    NSString * params = [NSString stringWithFormat:@"%ld/%@", [[self category] categoryId], @"en"];
    NSString * dataURL = [[SERVICE_PATH stringByAppendingString: @"/product/products/count/"] stringByAppendingString:params];
    
    NSURL * dataUrl = [NSURL URLWithString:dataURL];
    NSData *datas = [NSData dataWithContentsOfURL:dataUrl];
    
    NSDictionary * jsonData = [NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingMutableContainers error:	nil];
    if( jsonData != nil)
       count = [[jsonData valueForKey:@"count"] integerValue];
    else
        count = 0;
    
}

-(NSMutableArray *) next {
    NSMutableArray * pros = nil;
    
    if( [self start] + DEFAULT_COUNT < [self count]) {
        [self setStart: [self start] + DEFAULT_COUNT];
        
        pros = [self getByCategory:[self start] count: DEFAULT_COUNT ];
    } else if( [self start] < [self count]) {
        [self setStart: [self start] + [self count] - [self start]];
        pros = [self getByCategory: [self start] count:[self count] - [self start]];
    }
    
    if( pros != nil) {
        if( [self products ] != nil) {
            [[self products] addObjectsFromArray:pros];
        } else {
            [self setProducts: pros];
        }
    }
    return pros;
}

-(ATProduct*) getProductAt: (int) index {
    return products != nil && [products count] > 0 ? [products objectAtIndex:index] : nil;
}

@end
