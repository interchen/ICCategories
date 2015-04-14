//
//  NSManagedObject+Helper.h
//  Miku
//
//  Created by 陈 颜俊 on 14-8-3.
//  Copyright (c) 2014年 UULIAN. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Helper)
+ (NSArray *)fetchAllWithContext:(NSManagedObjectContext *)context entityName:(NSString *)entityName;
+ (NSArray *)fetchAllWithContext:(NSManagedObjectContext *)context entityName:(NSString *)entityName  sortDecriptors:(NSArray *)sortDescriptors;
+ (id)fetchObjectWithContext:(NSManagedObjectContext *)context entityName:(NSString *)entityName predicate:(NSPredicate *)predicate;
+ (id)createWithContext:(NSManagedObjectContext *)context entityName:(NSString *)entityName;
@end
