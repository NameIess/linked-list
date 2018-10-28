//
//  AppDelegate.h
//  Lab3DvuxSvSp
//
//  Created by Dima  on 10/28/18.
//  Copyright © 2018 Dima . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

