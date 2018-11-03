//
//  Node.m
//  Lab3DvuxSvSp
//
//  Created by Dima  on 10/28/18.
//  Copyright © 2018 Dima . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Node.h"

@implementation Node

- (instancetype)initWith:(Node*) next previous:(Node*) previous value:(NSString*) value
{
    self = [super init];
    if (self) {
        self.next = next;
        self.previous = previous;
        self.value = value;
    }
    return self;
}

- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    } else if (![super isEqual:other]) {
        return NO;
    } else {
        Node* node = other;
        return [node.next isEqual:_next] && [node.previous isEqual:_previous] && [node.value isEqual:_value];
    }
}


- (NSUInteger)hash
{
    return [self.next  hash] ^ [self.previous hash] ^ [self.value hash];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"value =  %@, prev = %@, next = %@ " , _value, _previous.value, _next.value ];
}

@end
