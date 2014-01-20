//
//  ATCategory.h
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/12/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATCategory : NSObject
@property long	categoryId;
@property  NSString	*name;
@property  NSString	*type;
@property  NSString	*lang;
@property  NSString	*image;
@property  NSString	*banner;
@property  NSString	*url;
@property  NSString	*slug;
@property  int		discount;
@property  NSString	*promotion;
@property  NSString	*link;
@property  NSString	*description;
@property  NSString	*metaTitle;
@property  NSString	*metaKeyword;
@property  NSString	*metaDescription;
@property  long	parentId;
@property  int		lft;
@property  int		rght;
@property  int		status;
@end
