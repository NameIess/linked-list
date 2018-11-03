//
//  NSObject+LinkedList.h
//  Lab3DvuxSvSp
//
//  Created by Dima  on 10/28/18.
//  Copyright © 2018 Dima . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedList : NSObject

- (BOOL) addFirst:(NSString*) value;
- (BOOL) addLast:(NSString*) value;
- (BOOL) deleteValue:(NSString*) value;
- (BOOL) deleteFirst:(NSString*) value;
- (BOOL) deleteLast:(NSString*) value;
- (LinkedList*) insertSort;
- (NSInteger) size;

@end
