//
//  NSObject+Node.h
//  Lab3DvuxSvSp
//
//  Created by Dima  on 10/28/18.
//  Copyright © 2018 Dima . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject 

@property (strong, nonatomic) Node* next;
@property (strong, nonatomic) Node* previous;
@property (strong, nonatomic) NSString* value;

- (instancetype)initWith:(Node*) next previous:(Node*) previous value:(NSString*) value;


@end
