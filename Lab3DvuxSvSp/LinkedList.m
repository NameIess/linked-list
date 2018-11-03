//
//  LinkedList.m
//  Lab3DvuxSvSp
//
//  Created by Dima  on 10/28/18.
//  Copyright © 2018 Dima . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+LinkedList.h"
#import "NSObject+Node.h"

@interface LinkedList ()

@property (strong, nonatomic) NSMutableArray* array;

@end

@implementation LinkedList 

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.array = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithArray:(NSMutableArray*) newArray
{
    self = [super init];
    if (self) {
        self.array = [[NSMutableArray alloc]initWithArray:newArray];
    }
    return self;
}

- (BOOL) addLast:(NSString *)value {
    NSInteger count = [self size];
    if (count == 0) {
        Node* noder = [[Node alloc] initWith:nil previous:nil value:value];
        [self.array addObject:noder];
    } else {
        Node* firstNodeInArray = [self.array firstObject];
        Node* lastNodeInArray = [self.array lastObject];
        Node* node = [[Node alloc] initWith:nil previous: lastNodeInArray value:value];
        lastNodeInArray.next = node;
        node.next = firstNodeInArray;
        firstNodeInArray.previous = node;
        [self.array addObject:node];
    }
    return true;
}

- (BOOL) addFirst:(NSString *)value {
    Node* lastNodeInArray = [self.array lastObject];
    Node* firstNodeInArray = [self.array firstObject];
    Node* noder = [[Node alloc] initWith:firstNodeInArray previous:lastNodeInArray value:value];
    firstNodeInArray.previous = noder;
    lastNodeInArray.next = noder;
    [self.array insertObject:noder atIndex:0];
    return true;
}

- (BOOL) deleteValue:(NSString *) value {
    for (Node* node in self.array) {
        if ([value isEqual:node.value]) {
            [self.array removeObject:node];
        }
    }
    return nil;
}

- (BOOL) deleteLast:(NSString *)value {
    Node* firstNodeInArray = [self.array firstObject];
    Node* preLastNode = [self.array objectAtIndex:[self size] - 1];
    [self.array removeLastObject];
    preLastNode.next = firstNodeInArray;
    firstNodeInArray.previous = preLastNode;
    return true;
}

- (BOOL) deleteFirst:(NSString *)value {
    Node* lastNodeInArray = [self.array lastObject];
    Node* firsNodeInArray = [self.array firstObject];
    Node* secondNodeInArray = [self.array objectAtIndex:1];
    [self.array removeObject:firsNodeInArray];
    secondNodeInArray.previous = lastNodeInArray;
    lastNodeInArray.next = secondNodeInArray;
    return true;
}

- (NSInteger) size {
    return [self.array count];
}

- (NSString *)description
{
    NSMutableString* string = [[NSMutableString alloc] init];
    for (Node* node in self.array) {
        [string appendString:[NSMutableString stringWithFormat:@"\n list index = `%@`, node = `%@`", [NSNumber numberWithInteger:[_array indexOfObject:node]], node]];
    }
    return string;
}

	
- (LinkedList*) insertSort {
    NSMutableArray* newArray = [[NSMutableArray alloc] initWithArray:self.array];
    for (int i = 1; i < [newArray count]; i++) {
        Node* currentNode = [newArray objectAtIndex:i];
        NSInteger currentValue = [currentNode.value integerValue];
        NSInteger backIndex = i;
        if (currentValue > [[[newArray objectAtIndex:backIndex - 1] value] integerValue]) {
            Node* previous = [newArray objectAtIndex:i - 1];
            currentNode.previous = previous;
            previous.next = currentNode;
        }
        
        while (backIndex > 0 && currentValue < [[[newArray objectAtIndex:backIndex - 1] value] integerValue]) {
            //get values
            Node* current = [newArray objectAtIndex:backIndex];//3
            Node* prev = [newArray objectAtIndex:backIndex - 1]; // 4
            Node* currentNext = current.next;//5
            Node* prevPrev = prev.previous;//1
            
            current.previous = prevPrev;//3.prev -> 1
            prevPrev.next = current;//1.next -> 3
            
            current.next = prev;// 3.next -> 4
            prev.previous = current;//4.prev -> 3

            currentNext.previous = prev;//5.prev -> 4
            prev.next = currentNext;//4.next -> 5
            
            [newArray exchangeObjectAtIndex:backIndex - 1  withObjectAtIndex:backIndex];
            backIndex--;
            
        }
    }
    LinkedList* newList = [[LinkedList alloc] initWithArray:newArray];
    return newList;
}

@end
