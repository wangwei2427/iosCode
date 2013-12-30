//
//  Entity.h
//  loadDemo
//
//  Created by Wei Wang on 12/25/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) NSString * team;

@end
